abstract type InverterComponent <: DynamicComponent end

mutable struct DynamicInverter{
    C <: Converter,
    O <: OuterControl,
    IC <: InnerControl,
    DC <: DCSource,
    P <: FrequencyEstimator,
    F <: Filter,
} <: DynamicInjection
    static_injector::Union{Nothing, StaticInjection}
    ω_ref::Float64
    converter::C
    outer_control::O
    inner_control::IC
    dc_source::DC
    freq_estimator::P
    filter::F #add MVAbase here
    n_states::Int64
    states::Vector{Symbol}
    ext::Dict{String, Any}
    internal::InfrastructureSystemsInternal
end

function DynamicInverter(
    static_injector::StaticInjection,
    ω_ref::Float64,
    converter::C,
    outer_control::O,
    inner_control::IC,
    dc_source::DC,
    freq_estimator::P,
    filter::F,
    ext::Dict{String, Any} = Dict{String, Any}(),
) where {
    C <: Converter,
    O <: OuterControl,
    IC <: InnerControl,
    DC <: DCSource,
    P <: FrequencyEstimator,
    F <: Filter,
}

    n_states = (
        get_n_states(converter) +
        get_n_states(outer_control) +
        get_n_states(inner_control) +
        get_n_states(dc_source) +
        get_n_states(freq_estimator) +
        get_n_states(filter)
    )

    states = vcat(
        get_states(converter),
        get_states(outer_control),
        get_states(inner_control),
        get_states(dc_source),
        get_states(freq_estimator),
        get_states(filter),
    )

    return DynamicInverter{C, O, IC, DC, P, F}(
        static_injector,
        ω_ref,
        converter,
        outer_control,
        inner_control,
        dc_source,
        freq_estimator,
        filter,
        n_states,
        states,
        ext,
        InfrastructureSystemsInternal(),
    )
end

function DynamicInverter(;
    static_injector::StaticInjection,
    ω_ref::Float64,
    converter::C,
    outer_control::O,
    inner_control::IC,
    dc_source::DC,
    freq_estimator::P,
    filter::F,
    ext::Dict{String, Any} = Dict{String, Any}(),
) where {
    C <: Converter,
    O <: OuterControl,
    IC <: InnerControl,
    DC <: DCSource,
    P <: FrequencyEstimator,
    F <: Filter,
}
    DynamicInverter(
        static_injector,
        ω_ref,
        converter,
        outer_control,
        inner_control,
        dc_source,
        freq_estimator,
        filter,
        ext,
    )
end

IS.get_name(device::DynamicInverter) = get_name(device.static_injector)
get_bus(device::DynamicInverter) = get_bus(device.static_injector)
get_inverter_Sbase(device::DynamicInverter) = device.converter.s_rated
get_ω_ref(device::DynamicInverter) = device.ω_ref
get_base_power(device::DynamicInverter) = get_base_power(device.static_injector)
get_ext(device::DynamicInverter) = device.ext
get_states(device::DynamicInverter) = device.states
get_n_states(device::DynamicInverter) = device.n_states
get_converter(device::DynamicInverter) = device.converter
get_outer_control(device::DynamicInverter) = device.outer_control
get_inner_control(device::DynamicInverter) = device.inner_control
get_dc_source(device::DynamicInverter) = device.dc_source
get_freq_estimator(device::DynamicInverter) = device.freq_estimator
get_filter(device::DynamicInverter) = device.filter
get_static_injector(device::DynamicInverter) = device.static_injector
get_internal(device::DynamicInverter) = device.internal
get_P_ref(value::DynamicInverter) = get_P_ref(get_active_power(get_outer_control(value)))
get_V_ref(value::DynamicInverter) = get_V_ref(get_reactive_power(get_outer_control(value)))

set_ω_ref!(device::DynamicInverter, val::Float64) = device.ω_ref = val

function update_indexing!(device::DynamicInverter)
    device.n_states = (
        get_n_states(device.converter) +
        get_n_states(device.outer_control) +
        get_n_states(device.inner_control) +
        get_n_states(device.dc_source) +
        get_n_states(device.freq_estimator) +
        get_n_states(device.filter)
    )

    device.states = vcat(
        get_states(device.converter),
        get_states(device.outer_control),
        get_states(device.inner_control),
        get_states(device.dc_source),
        get_states(device.freq_estimator),
        get_states(device.filter),
    )
    return
end

function set_converter!(device::DynamicInverter, val::Converter)
    device.converter = val
    update_indexing!(device)
    return
end

function set_outer_control!(device::DynamicInverter, val::OuterControl)
    device.outer_control = val
    update_indexing!(device)
    return
end

function set_inner_control!(device::DynamicInverter, val::InnerControl)
    device.inner_control = val
    update_indexing!(device)
    return
end

function set_dc_source!(device::DynamicInverter, val::DCSource)
    device.dc_source = val
    update_indexing!(device)
    return
end

function set_freq_estimator!(device::DynamicInverter, val::FrequencyEstimator)
    device.freq_estimator = val
    update_indexing!(device)
    return
end

function set_filter!(device::DynamicInverter, val::Filter)
    device.filter = val
    update_indexing!(device)
    return
end
