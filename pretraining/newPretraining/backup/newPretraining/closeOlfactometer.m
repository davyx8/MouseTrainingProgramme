 traileID=sprintf('pelegLOG_%d_%d_%d_%d_%d_%d.csv',fix(clock()));
    logger = Logger(traileID,...
        @(h2) invoke(h2, 'SetDigOut', 1 ,1 ,0),...
        @(h2) invoke(h2, 'SetDigOut', 1 ,0 ,0));
    [ h2, resultOpen, resultLastError, resultID]= olfactometerConnect(logger);
    olfactometerSetOder(h2, 1, logger, 2, 0);
olfactometerSetFinalValve(h2, 1, logger, 0);