classdef SimpleMindedTest < matlab.unittest.TestCase
    
    properties
       TestFigure 
    end
    
    methods(TestMethodSetup)
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % newFigure
        % Setting up a new figure for testing
        % and assinging to testCase property
        % INPUT:
        % testCase
        % OUTPUT:
        % None.
        % SIDEEFFECTS:
        % new figure is created and handle stored in testCase.TestFigure
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function newFigure(testCase)
           testCase.TestFigure = figure; 
        end
    end
    
    methods(TestMethodTeardown)
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %closeFigure
        % Deletes the set up test figure.
        % INPUT:
        % OUTPUT:
        % SIDEEFFECTS:
        % figure is deleted.
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function closeFigure(testCase)
            close(testCase.TestFigure);
        end
    end
   
    methods(Test)
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % checkBrain
        % Checks simply if the function draws the right
        % number of triangles based on the number of vertices
        % and patches.
        % INPUT:
        % testCase
        % OUTPUT:
        % None.
        % SIDEEFFECTS:
        % brain surface figure is generated
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function checkBrain(testCase)
           h = simpleBrainSurface();
           testCase.verifyEqual(size(get(h,'Vertices')),[81924,3]);
           testCase.verifyEqual(size(get(h,'Faces')),[163840,3]);
        end
        
    end
    
end