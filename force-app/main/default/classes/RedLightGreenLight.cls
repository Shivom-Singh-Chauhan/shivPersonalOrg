/*
* In Order To give Input For Number of Test Case {<Integer> testCase}
* In Order To give input for number of people {<Integer> InputWrapper.noOfPeople}
* In Order To give input for Higeht of Both {<Integer> InputWrapper.hightOfBoth}
* In Order To give input for List of peoples hight {<List of integer> InputWrapper.peopleQueue}

---------------------------------------------------------------------------------------
SAMPLE INPUT
---------------------------------------------------------------------------------------

List<RedLightGreenLight.InputWrapper> instance = new List<RedLightGreenLight.InputWrapper>();
RedLightGreenLight.InputWrapper ins1 = new RedLightGreenLight.InputWrapper();
RedLightGreenLight.InputWrapper ins2 = new RedLightGreenLight.InputWrapper();
RedLightGreenLight.InputWrapper ins3 = new RedLightGreenLight.InputWrapper();
List<Integer> people1 = new List<Integer>();
List<Integer> people2 = new List<Integer>();
List<Integer> people3 = new List<Integer>();

ins1.noOfPeople = 4;
ins1.hightOfBoth = 10;
people1.add(2);
people1.add(13);
people1.add(4);
people1.add(16);
ins1.peopleQueue = people1;       
instance.add(ins1);

ins2.noOfPeople = 5;
ins2.hightOfBoth = 8;
people2.add(9);
people2.add(3);
people2.add(8);
people2.add(8);
people2.add(4);        
ins2.peopleQueue = people2;       
instance.add(ins2);


ins3.noOfPeople = 4;
ins3.hightOfBoth = 6;
people3.add(1);
people3.add(2);
people3.add(3);
people3.add(4);
ins3.peopleQueue = people3;       
instance.add(ins3);
system.debug(instance);

RedLightGreenLight.squidGames(3, instance);

*/
public class RedLightGreenLight {
    public static void squidGames(integer testCase, List<InputWrapper> testInput){
        integer peopleGetShot;
        system.debug(testInput);
        for(InputWrapper wrap:testInput){
            peopleGetShot = 0;
            for(Integer peopleHight : wrap.peopleQueue){
                if(peopleHight>wrap.hightOfBoth){
                    peopleGetShot++;
                }    
            }
            system.debug(peopleGetShot);
        }        
    }
    public class InputWrapper{
        public integer noOfPeople;
        public integer hightOfBoth;
        public List<integer> peopleQueue;
    }
}