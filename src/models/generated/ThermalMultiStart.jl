#=
This file is auto-generated. Do not edit.
=#
"""
    mutable struct ThermalMultiStart <: ThermalGen
        name::String
        available::Bool
        status::Bool
        bus::Bus
        active_power::Float64
        reactive_power::Float64
        rating::Float64
        prime_mover::PrimeMovers.PrimeMover
        fuel::ThermalFuels.ThermalFuel
        active_power_limits::NamedTuple{(:min, :max), Tuple{Float64, Float64}}
        reactive_power_limits::Union{Nothing, Min_Max}
        ramp_limits::Union{Nothing, NamedTuple{(:up, :down), Tuple{Float64, Float64}}}
        power_trajectory::Union{Nothing, NamedTuple{(:startup, :shutdown), Tuple{Float64, Float64}}}
        time_limits::Union{Nothing, NamedTuple{(:up, :down), Tuple{Float64, Float64}}}
        start_time_limits::Union{Nothing, NamedTuple{(:hot, :warm, :cold), Tuple{Float64, Float64, Float64}}}
        start_types::Int
        operation_cost::MultiStartCost
        base_power::Float64
        services::Vector{Service}
        time_at_status::Float64
        must_run::Bool
        dynamic_injector::Union{Nothing, DynamicInjection}
        ext::Dict{String, Any}
        forecasts::InfrastructureSystems.Forecasts
        internal::InfrastructureSystemsInternal
    end

Data Structure for thermal generation technologies.

# Arguments
- `name::String`
- `available::Bool`
- `status::Bool`
- `bus::Bus`
- `active_power::Float64`, validation range: active_power_limits, action if invalid: warn
- `reactive_power::Float64`, validation range: reactive_power_limits, action if invalid: warn
- `rating::Float64`: Thermal limited MVA Power Output of the unit. <= Capacity, validation range: (0, nothing), action if invalid: error
- `prime_mover::PrimeMovers.PrimeMover`: prime_mover Technology according to EIA 923
- `fuel::ThermalFuels.ThermalFuel`: prime_mover Fuel according to EIA 923
- `active_power_limits::NamedTuple{(:min, :max), Tuple{Float64, Float64}}`
- `reactive_power_limits::Union{Nothing, Min_Max}`
- `ramp_limits::Union{Nothing, NamedTuple{(:up, :down), Tuple{Float64, Float64}}}`, validation range: (0, nothing), action if invalid: error
- `power_trajectory::Union{Nothing, NamedTuple{(:startup, :shutdown), Tuple{Float64, Float64}}}`: Power trajectory the unit will take during the startup and shutdown ramp process, validation range: (0, nothing), action if invalid: error
- `time_limits::Union{Nothing, NamedTuple{(:up, :down), Tuple{Float64, Float64}}}`: Minimum up and Minimum down time limits in hours, validation range: (0, nothing), action if invalid: error
- `start_time_limits::Union{Nothing, NamedTuple{(:hot, :warm, :cold), Tuple{Float64, Float64, Float64}}}`:  Time limits for startup based on turbine temperature in hours
- `start_types::Int`:  Number of startup based on turbine temperature, validation range: (1, 3), action if invalid: error
- `operation_cost::MultiStartCost`
- `base_power::Float64`: Base power of the unit in MVA, validation range: (0, nothing), action if invalid: warn
- `services::Vector{Service}`: Services that this device contributes to
- `time_at_status::Float64`
- `must_run::Bool`
- `dynamic_injector::Union{Nothing, DynamicInjection}`: corresponding dynamic injection device
- `ext::Dict{String, Any}`
- `forecasts::InfrastructureSystems.Forecasts`: internal forecast storage
- `internal::InfrastructureSystemsInternal`: power system internal reference, do not modify
"""
mutable struct ThermalMultiStart <: ThermalGen
    name::String
    available::Bool
    status::Bool
    bus::Bus
    active_power::Float64
    reactive_power::Float64
    "Thermal limited MVA Power Output of the unit. <= Capacity"
    rating::Float64
    "prime_mover Technology according to EIA 923"
    prime_mover::PrimeMovers.PrimeMover
    "prime_mover Fuel according to EIA 923"
    fuel::ThermalFuels.ThermalFuel
    active_power_limits::NamedTuple{(:min, :max), Tuple{Float64, Float64}}
    reactive_power_limits::Union{Nothing, Min_Max}
    ramp_limits::Union{Nothing, NamedTuple{(:up, :down), Tuple{Float64, Float64}}}
    "Power trajectory the unit will take during the startup and shutdown ramp process"
    power_trajectory::Union{Nothing, NamedTuple{(:startup, :shutdown), Tuple{Float64, Float64}}}
    "Minimum up and Minimum down time limits in hours"
    time_limits::Union{Nothing, NamedTuple{(:up, :down), Tuple{Float64, Float64}}}
    " Time limits for startup based on turbine temperature in hours"
    start_time_limits::Union{Nothing, NamedTuple{(:hot, :warm, :cold), Tuple{Float64, Float64, Float64}}}
    " Number of startup based on turbine temperature"
    start_types::Int
    operation_cost::MultiStartCost
    "Base power of the unit in MVA"
    base_power::Float64
    "Services that this device contributes to"
    services::Vector{Service}
    time_at_status::Float64
    must_run::Bool
    "corresponding dynamic injection device"
    dynamic_injector::Union{Nothing, DynamicInjection}
    ext::Dict{String, Any}
    "internal forecast storage"
    forecasts::InfrastructureSystems.Forecasts
    "power system internal reference, do not modify"
    internal::InfrastructureSystemsInternal
end

function ThermalMultiStart(name, available, status, bus, active_power, reactive_power, rating, prime_mover, fuel, active_power_limits, reactive_power_limits, ramp_limits, power_trajectory, time_limits, start_time_limits, start_types, operation_cost, base_power, services=Device[], time_at_status=INFINITE_TIME, must_run=false, dynamic_injector=nothing, ext=Dict{String, Any}(), forecasts=InfrastructureSystems.Forecasts(), )
    ThermalMultiStart(name, available, status, bus, active_power, reactive_power, rating, prime_mover, fuel, active_power_limits, reactive_power_limits, ramp_limits, power_trajectory, time_limits, start_time_limits, start_types, operation_cost, base_power, services, time_at_status, must_run, dynamic_injector, ext, forecasts, InfrastructureSystemsInternal(), )
end

function ThermalMultiStart(; name, available, status, bus, active_power, reactive_power, rating, prime_mover, fuel, active_power_limits, reactive_power_limits, ramp_limits, power_trajectory, time_limits, start_time_limits, start_types, operation_cost, base_power, services=Device[], time_at_status=INFINITE_TIME, must_run=false, dynamic_injector=nothing, ext=Dict{String, Any}(), forecasts=InfrastructureSystems.Forecasts(), )
    ThermalMultiStart(name, available, status, bus, active_power, reactive_power, rating, prime_mover, fuel, active_power_limits, reactive_power_limits, ramp_limits, power_trajectory, time_limits, start_time_limits, start_types, operation_cost, base_power, services, time_at_status, must_run, dynamic_injector, ext, forecasts, )
end

# Constructor for demo purposes; non-functional.
function ThermalMultiStart(::Nothing)
    ThermalMultiStart(;
        name="init",
        available=false,
        status=false,
        bus=Bus(nothing),
        active_power=0.0,
        reactive_power=0.0,
        rating=0.0,
        prime_mover=PrimeMovers.OT,
        fuel=ThermalFuels.OTHER,
        active_power_limits=(min=0.0, max=0.0),
        reactive_power_limits=nothing,
        ramp_limits=nothing,
        power_trajectory=nothing,
        time_limits=nothing,
        start_time_limits=nothing,
        start_types=1,
        operation_cost=MultiStartCost(nothing),
        base_power=0.0,
        services=Device[],
        time_at_status=INFINITE_TIME,
        must_run=false,
        dynamic_injector=nothing,
        ext=Dict{String, Any}(),
        forecasts=InfrastructureSystems.Forecasts(),
    )
end


InfrastructureSystems.get_name(value::ThermalMultiStart) = value.name
"""Get ThermalMultiStart available."""
get_available(value::ThermalMultiStart) = value.available
"""Get ThermalMultiStart status."""
get_status(value::ThermalMultiStart) = value.status
"""Get ThermalMultiStart bus."""
get_bus(value::ThermalMultiStart) = value.bus
"""Get ThermalMultiStart active_power."""
get_active_power(value::ThermalMultiStart) = get_value(value, value.active_power)
"""Get ThermalMultiStart reactive_power."""
get_reactive_power(value::ThermalMultiStart) = get_value(value, value.reactive_power)
"""Get ThermalMultiStart rating."""
get_rating(value::ThermalMultiStart) = get_value(value, value.rating)
"""Get ThermalMultiStart prime_mover."""
get_prime_mover(value::ThermalMultiStart) = value.prime_mover
"""Get ThermalMultiStart fuel."""
get_fuel(value::ThermalMultiStart) = value.fuel
"""Get ThermalMultiStart active_power_limits."""
get_active_power_limits(value::ThermalMultiStart) = get_value(value, value.active_power_limits)
"""Get ThermalMultiStart reactive_power_limits."""
get_reactive_power_limits(value::ThermalMultiStart) = get_value(value, value.reactive_power_limits)
"""Get ThermalMultiStart ramp_limits."""
get_ramp_limits(value::ThermalMultiStart) = get_value(value, value.ramp_limits)
"""Get ThermalMultiStart power_trajectory."""
get_power_trajectory(value::ThermalMultiStart) = value.power_trajectory
"""Get ThermalMultiStart time_limits."""
get_time_limits(value::ThermalMultiStart) = value.time_limits
"""Get ThermalMultiStart start_time_limits."""
get_start_time_limits(value::ThermalMultiStart) = value.start_time_limits
"""Get ThermalMultiStart start_types."""
get_start_types(value::ThermalMultiStart) = value.start_types
"""Get ThermalMultiStart operation_cost."""
get_operation_cost(value::ThermalMultiStart) = value.operation_cost
"""Get ThermalMultiStart base_power."""
get_base_power(value::ThermalMultiStart) = value.base_power
"""Get ThermalMultiStart services."""
get_services(value::ThermalMultiStart) = value.services
"""Get ThermalMultiStart time_at_status."""
get_time_at_status(value::ThermalMultiStart) = value.time_at_status
"""Get ThermalMultiStart must_run."""
get_must_run(value::ThermalMultiStart) = value.must_run
"""Get ThermalMultiStart dynamic_injector."""
get_dynamic_injector(value::ThermalMultiStart) = value.dynamic_injector
"""Get ThermalMultiStart ext."""
get_ext(value::ThermalMultiStart) = value.ext

InfrastructureSystems.get_forecasts(value::ThermalMultiStart) = value.forecasts
"""Get ThermalMultiStart internal."""
get_internal(value::ThermalMultiStart) = value.internal


InfrastructureSystems.set_name!(value::ThermalMultiStart, val::String) = value.name = val
"""Set ThermalMultiStart available."""
set_available!(value::ThermalMultiStart, val::Bool) = value.available = val
"""Set ThermalMultiStart status."""
set_status!(value::ThermalMultiStart, val::Bool) = value.status = val
"""Set ThermalMultiStart bus."""
set_bus!(value::ThermalMultiStart, val::Bus) = value.bus = val
"""Set ThermalMultiStart active_power."""
set_active_power!(value::ThermalMultiStart, val::Float64) = value.active_power = val
"""Set ThermalMultiStart reactive_power."""
set_reactive_power!(value::ThermalMultiStart, val::Float64) = value.reactive_power = val
"""Set ThermalMultiStart rating."""
set_rating!(value::ThermalMultiStart, val::Float64) = value.rating = val
"""Set ThermalMultiStart prime_mover."""
set_prime_mover!(value::ThermalMultiStart, val::PrimeMovers.PrimeMover) = value.prime_mover = val
"""Set ThermalMultiStart fuel."""
set_fuel!(value::ThermalMultiStart, val::ThermalFuels.ThermalFuel) = value.fuel = val
"""Set ThermalMultiStart active_power_limits."""
set_active_power_limits!(value::ThermalMultiStart, val::NamedTuple{(:min, :max), Tuple{Float64, Float64}}) = value.active_power_limits = val
"""Set ThermalMultiStart reactive_power_limits."""
set_reactive_power_limits!(value::ThermalMultiStart, val::Union{Nothing, Min_Max}) = value.reactive_power_limits = val
"""Set ThermalMultiStart ramp_limits."""
set_ramp_limits!(value::ThermalMultiStart, val::Union{Nothing, NamedTuple{(:up, :down), Tuple{Float64, Float64}}}) = value.ramp_limits = val
"""Set ThermalMultiStart power_trajectory."""
set_power_trajectory!(value::ThermalMultiStart, val::Union{Nothing, NamedTuple{(:startup, :shutdown), Tuple{Float64, Float64}}}) = value.power_trajectory = val
"""Set ThermalMultiStart time_limits."""
set_time_limits!(value::ThermalMultiStart, val::Union{Nothing, NamedTuple{(:up, :down), Tuple{Float64, Float64}}}) = value.time_limits = val
"""Set ThermalMultiStart start_time_limits."""
set_start_time_limits!(value::ThermalMultiStart, val::Union{Nothing, NamedTuple{(:hot, :warm, :cold), Tuple{Float64, Float64, Float64}}}) = value.start_time_limits = val
"""Set ThermalMultiStart start_types."""
set_start_types!(value::ThermalMultiStart, val::Int) = value.start_types = val
"""Set ThermalMultiStart operation_cost."""
set_operation_cost!(value::ThermalMultiStart, val::MultiStartCost) = value.operation_cost = val
"""Set ThermalMultiStart base_power."""
set_base_power!(value::ThermalMultiStart, val::Float64) = value.base_power = val
"""Set ThermalMultiStart services."""
set_services!(value::ThermalMultiStart, val::Vector{Service}) = value.services = val
"""Set ThermalMultiStart time_at_status."""
set_time_at_status!(value::ThermalMultiStart, val::Float64) = value.time_at_status = val
"""Set ThermalMultiStart must_run."""
set_must_run!(value::ThermalMultiStart, val::Bool) = value.must_run = val
"""Set ThermalMultiStart dynamic_injector."""
set_dynamic_injector!(value::ThermalMultiStart, val::Union{Nothing, DynamicInjection}) = value.dynamic_injector = val
"""Set ThermalMultiStart ext."""
set_ext!(value::ThermalMultiStart, val::Dict{String, Any}) = value.ext = val

InfrastructureSystems.set_forecasts!(value::ThermalMultiStart, val::InfrastructureSystems.Forecasts) = value.forecasts = val
"""Set ThermalMultiStart internal."""
set_internal!(value::ThermalMultiStart, val::InfrastructureSystemsInternal) = value.internal = val