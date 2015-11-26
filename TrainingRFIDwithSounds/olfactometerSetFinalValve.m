function olfactometerSetFinalValve( h2, slave, logger, open )
%OLFACTOMETERSETFINALVALVE opens or closes final valve
    invoke(h2, 'SetGateValve2', slave, 31, open, 0);
end

