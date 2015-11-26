function olfactometerSetOder( h2, slave, logger, oder, open )
%OLFACTOMETERSETODER opens or closes oder valve

    invoke(h2, 'SetOdorValve', slave, oder, open);   
   
end

