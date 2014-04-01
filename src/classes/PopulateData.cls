public class PopulateData{
    
    /*exec anonymous with actual example queries. 
        //all workshops and rooms
        List<Workshop__c> rightOuter = [SELECT Id, Name, Room__c, Room__r.Id, Room__r.Capacity__c FROM Workshop__c  WHERE Status__c = 'Open'];
        
        //all rooms and the list of workshops
        List<Room__c> leftOuter = [SELECT Id, Name, (SELECT Id, Status__c FROM Workshops__r) FROM Room__c WHERE Capacity__c > 10];
        
        //all rooms, but only if they have a workshop
        List<Room__c> leftInner = [SELECT Id, Name, Capacity__c FROM Room__c WHERE Id IN (SELECT Room__c FROM Workshop__c)];
        
        //all workshops in a room with a capacity greater than 10
        List<Workshop__c> rightInner = [Select Id, Name, Room__r.Name, Room__r.Capacity__c FROM Workshop__c WHERE Room__r.Capacity__c > 10];
        
        //all workshops without a room
        List<Workshop__c> rightAnti = [Select Id, Name from Workshop__c where Room__c = null ];
        
        //all rooms without any workshops
        List<Room__c> leftAnti = [Select Id, Name from Room__c where Id NOT IN (SELECT Room__c FROM Workshop__c)];
        
        System.debug(rightOuter);
        System.debug(leftOuter);
        System.debug(leftInner);
        System.debug(rightInner);
        System.debug(rightAnti);
        System.debug(leftAnti);
	*/
    
    public static void createData(){
        List<Room__c> rms = new List<Room__c>();
        List<Workshop__c> wkshops = new List<Workshop__c>();
        
		rms.add(new Room__c(Name='Cedar 1', Capacity__c=10, Configuration__c='', Projector__c=true));        
		rms.add(new Room__c(Name='Cedar 2', Capacity__c=10, Configuration__c='', Projector__c=true));        
		rms.add(new Room__c(Name='Cedar 3', Capacity__c=4, Configuration__c='', Projector__c=true));        
		rms.add(new Room__c(Name='Cedar 4', Capacity__c=4, Configuration__c='', Projector__c=true));        
		rms.add(new Room__c(Name='Beech 1', Capacity__c=20, Configuration__c='', Projector__c=true));        
		rms.add(new Room__c(Name='Beech 2', Capacity__c=16, Configuration__c='', Projector__c=true));        
		rms.add(new Room__c(Name='Beech 3', Capacity__c=6, Configuration__c='', Projector__c=true));        
		rms.add(new Room__c(Name='Beech 4', Capacity__c=6, Configuration__c='', Projector__c=true));        
		rms.add(new Room__c(Name='Elm', Capacity__c=10, Configuration__c='', Projector__c=true));        
		rms.add(new Room__c(Name='Larch Auditorium', Capacity__c=10, Configuration__c='Theatre', Projector__c=true));    
        
        insert rms; 
        
        wkshops.add(new Workshop__c(Name='Introduction to Force.com',Room__c=rms[0].Id,Status__c='Planning',Type__c='Adult Education',Start_Time__c=Datetime.valueof('2014-02-15 12:00:00'),End_Time__c=Datetime.valueof('2014-02-15 13:00:00')));
        wkshops.add(new Workshop__c(Name='Movie Night',Room__c=rms[0].Id,Status__c='Open',Type__c='Culture',Start_Time__c=Datetime.valueof('2014-03-15 12:00:00'),End_Time__c=Datetime.valueof('2014-03-15 13:00:00')));
        wkshops.add(new Workshop__c(Name='Macramé',Status__c='Cancelled',Type__c='Crafts',Start_Time__c=Datetime.valueof('2014-04-15 12:00:00'),End_Time__c=Datetime.valueof('2014-04-15 13:00:00')));
        wkshops.add(new Workshop__c(Name='Introduction to Force.com',Status__c='Planning',Type__c='Adult Education',Start_Time__c=Datetime.valueof('2014-05-15 12:00:00'),End_Time__c=Datetime.valueof('2014-05-15 13:00:00')));
        wkshops.add(new Workshop__c(Name='Yogalicious',Room__c=rms[1].Id,Status__c='Open',Type__c='Health and Wellbeing',Start_Time__c=Datetime.valueof('2014-06-15 12:00:00'),End_Time__c=Datetime.valueof('2014-06-15 13:00:00')));
        wkshops.add(new Workshop__c(Name='Basket Weaving',Room__c=rms[1].Id,Status__c='Complete',Type__c='Crafts',Start_Time__c=Datetime.valueof('2014-07-15 12:00:00'),End_Time__c=Datetime.valueof('2014-07-15 13:00:00')));
        wkshops.add(new Workshop__c(Name='Russian for Business',Room__c=rms[1].Id,Status__c='Open',Type__c='Adult Education',Start_Time__c=Datetime.valueof('2014-08-15 12:00:00'),End_Time__c=Datetime.valueof('2014-08-15 13:00:00')));
        wkshops.add(new Workshop__c(Name='Movie Night',Room__c=rms[1].Id,Status__c='Open',Type__c='Culture',Start_Time__c=Datetime.valueof('2014-09-15 12:00:00'),End_Time__c=Datetime.valueof('2014-09-15 13:00:00')));
        wkshops.add(new Workshop__c(Name='Knitting Nutters',Room__c=rms[2].Id,Status__c='Planning',Type__c='Crafts',Start_Time__c=Datetime.valueof('2014-10-15 12:00:00'),End_Time__c=Datetime.valueof('2014-10-15 13:00:00')));
        wkshops.add(new Workshop__c(Name='Introduction to Force.com',Room__c=rms[2].Id,Status__c='Complete',Type__c='Adult Education',Start_Time__c=Datetime.valueof('2014-11-15 12:00:00'),End_Time__c=Datetime.valueof('2014-11-15 13:00:00')));
        wkshops.add(new Workshop__c(Name='Chinning for Tight Abs',Room__c=rms[2].Id,Status__c='Open',Type__c='Health and Wellbeing',Start_Time__c=Datetime.valueof('2014-12-15 12:00:00'),End_Time__c=Datetime.valueof('2014-12-15 13:00:00')));
        wkshops.add(new Workshop__c(Name='Dance Appreciation',Room__c=rms[2].Id,Status__c='Cancelled',Type__c='Culture',Start_Time__c=Datetime.valueof('2014-02-15 13:00:00'),End_Time__c=Datetime.valueof('2014-02-15 14:00:00')));
        wkshops.add(new Workshop__c(Name='Macramé',Room__c=rms[3].Id,Status__c='Planning',Type__c='Crafts',Start_Time__c=Datetime.valueof('2014-03-15 13:00:00'),End_Time__c=Datetime.valueof('2014-03-15 14:00:00')));
        wkshops.add(new Workshop__c(Name='Home Electrical Wiring',Room__c=rms[3].Id,Status__c='Complete',Type__c='Adult Education',Start_Time__c=Datetime.valueof('2014-04-15 13:00:00'),End_Time__c=Datetime.valueof('2014-04-15 14:00:00')));
        wkshops.add(new Workshop__c(Name='Yo-Zumba',Room__c=rms[3].Id,Status__c='Open',Type__c='Health and Wellbeing',Start_Time__c=Datetime.valueof('2014-05-15 13:00:00'),End_Time__c=Datetime.valueof('2014-05-15 14:00:00')));
        wkshops.add(new Workshop__c(Name='Beginners Oboe',Room__c=rms[3].Id,Status__c='Planning',Type__c='Culture',Start_Time__c=Datetime.valueof('2014-06-15 13:00:00'),End_Time__c=Datetime.valueof('2014-06-15 14:00:00')));
        wkshops.add(new Workshop__c(Name='Basket Weaving',Status__c='Planning',Type__c='Crafts',Start_Time__c=Datetime.valueof('2014-07-15 13:00:00'),End_Time__c=Datetime.valueof('2014-07-15 14:00:00')));
        wkshops.add(new Workshop__c(Name='Introduction to Force.com',Room__c=rms[4].Id,Status__c='Open',Type__c='Adult Education',Start_Time__c=Datetime.valueof('2014-08-15 13:00:00'),End_Time__c=Datetime.valueof('2014-08-15 14:00:00')));
        wkshops.add(new Workshop__c(Name='Chinning for Tight Abs',Room__c=rms[5].Id,Status__c='Complete',Type__c='Health and Wellbeing',Start_Time__c=Datetime.valueof('2014-09-15 13:00:00'),End_Time__c=Datetime.valueof('2014-09-15 14:00:00')));
        wkshops.add(new Workshop__c(Name='Movie Night',Room__c=rms[5].Id,Status__c='Planning',Type__c='Culture',Start_Time__c=Datetime.valueof('2014-10-15 13:00:00'),End_Time__c=Datetime.valueof('2014-10-15 14:00:00')));
        wkshops.add(new Workshop__c(Name='Knitting Nutters',Room__c=rms[5].Id,Status__c='Open',Type__c='Crafts',Start_Time__c=Datetime.valueof('2014-11-15 13:00:00'),End_Time__c=Datetime.valueof('2014-11-15 14:00:00')));
        wkshops.add(new Workshop__c(Name='Home Electrical Wiring',Status__c='Cancelled',Type__c='Adult Education',Start_Time__c=Datetime.valueof('2014-12-15 13:00:00'),End_Time__c=Datetime.valueof('2014-12-15 14:00:00')));
        wkshops.add(new Workshop__c(Name='Yo-Zumba',Room__c=rms[6].Id,Status__c='Open',Type__c='Health and Wellbeing',Start_Time__c=Datetime.valueof('2014-02-15 14:00:00'),End_Time__c=Datetime.valueof('2014-02-15 15:00:00')));
        wkshops.add(new Workshop__c(Name='Dance Appreciation',Room__c=rms[7].Id,Status__c='Complete',Type__c='Culture',Start_Time__c=Datetime.valueof('2014-03-15 14:00:00'),End_Time__c=Datetime.valueof('2014-03-15 15:00:00')));
        wkshops.add(new Workshop__c(Name='Macramé',Status__c='Planning',Type__c='Crafts',Start_Time__c=Datetime.valueof('2014-04-15 14:00:00'),End_Time__c=Datetime.valueof('2014-04-15 15:00:00')));
        wkshops.add(new Workshop__c(Name='Introduction to Force.com',Room__c=rms[7].Id,Status__c='Open',Type__c='Adult Education',Start_Time__c=Datetime.valueof('2014-05-15 14:00:00'),End_Time__c=Datetime.valueof('2014-05-15 15:00:00')));
        wkshops.add(new Workshop__c(Name='Hip Hop Yoga',Status__c='Cancelled',Type__c='Health and Wellbeing',Start_Time__c=Datetime.valueof('2014-06-15 14:00:00'),End_Time__c=Datetime.valueof('2014-06-15 15:00:00')));
        wkshops.add(new Workshop__c(Name='Movie Night',Room__c=rms[8].Id,Status__c='Open',Type__c='Culture',Start_Time__c=Datetime.valueof('2014-07-15 14:00:00'),End_Time__c=Datetime.valueof('2014-07-15 15:00:00')));
        wkshops.add(new Workshop__c(Name='Basket Weaving',Room__c=rms[8].Id,Status__c='Complete',Type__c='Crafts',Start_Time__c=Datetime.valueof('2014-08-15 14:00:00'),End_Time__c=Datetime.valueof('2014-08-15 15:00:00')));
        wkshops.add(new Workshop__c(Name='Introduction to Force.com',Room__c=rms[8].Id,Status__c='Planning',Type__c='Adult Education',Start_Time__c=Datetime.valueof('2014-09-15 14:00:00'),End_Time__c=Datetime.valueof('2014-08-15 15:00:00')));
        wkshops.add(new Workshop__c(Name='Yogalicious',Room__c=rms[9].Id,Status__c='Open',Type__c='Health and Wellbeing',Start_Time__c=Datetime.valueof('2014-10-15 14:00:00'),End_Time__c=Datetime.valueof('2014-10-15 15:00:00')));
        wkshops.add(new Workshop__c(Name='Beginners Oboe',Room__c=rms[9].Id,Status__c='Open',Type__c='Culture',Start_Time__c=Datetime.valueof('2014-11-15 14:00:00'),End_Time__c=Datetime.valueof('2014-11-15 15:00:00')));
        wkshops.add(new Workshop__c(Name='Knitting Nutters',Room__c=rms[9].Id,Status__c='Open',Type__c='Crafts',Start_Time__c=Datetime.valueof('2014-12-15 14:00:00'),End_Time__c=Datetime.valueof('2014-12-15 15:00:00')));
        wkshops.add(new Workshop__c(Name='Introduction to Force.com',Room__c=rms[9].Id,Status__c='Open',Type__c='Adult Education',Start_Time__c=Datetime.valueof('2014-02-15 15:00:00'),End_Time__c=Datetime.valueof('2014-02-15 16:00:00')));
        wkshops.add(new Workshop__c(Name='Yo-Zumba',Room__c=rms[9].Id,Status__c='Complete',Type__c='Health and Wellbeing',Start_Time__c=Datetime.valueof('2014-03-15 15:00:00'),End_Time__c=Datetime.valueof('2014-03-15 16:00:00')));
        wkshops.add(new Workshop__c(Name='Dance Appreciation',Room__c=rms[0].Id,Status__c='Planning',Type__c='Culture',Start_Time__c=Datetime.valueof('2014-04-15 15:00:00'),End_Time__c=Datetime.valueof('2014-04-15 16:00:00')));
        wkshops.add(new Workshop__c(Name='Macramé',Room__c=rms[0].Id,Status__c='Cancelled',Type__c='Crafts',Start_Time__c=Datetime.valueof('2014-05-15 15:00:00'),End_Time__c=Datetime.valueof('2014-05-15 16:00:00')));
        wkshops.add(new Workshop__c(Name='IT Security for Everyone',Room__c=rms[0].Id,Status__c='Open',Type__c='Adult Education',Start_Time__c=Datetime.valueof('2014-06-15 15:00:00'),End_Time__c=Datetime.valueof('2014-06-15 16:00:00')));
        wkshops.add(new Workshop__c(Name='Hip Hop Aerobics',Room__c=rms[1].Id,Status__c='Complete',Type__c='Health and Wellbeing',Start_Time__c=Datetime.valueof('2014-07-15 15:00:00'),End_Time__c=Datetime.valueof('2014-07-15 16:00:00')));
        wkshops.add(new Workshop__c(Name='Beginners Oboe',Room__c=rms[1].Id,Status__c='Planning',Type__c='Culture',Start_Time__c=Datetime.valueof('2014-08-15 15:00:00'),End_Time__c=Datetime.valueof('2014-08-15 16:00:00')));
        wkshops.add(new Workshop__c(Name='Basket Weaving',Room__c=rms[2].Id,Status__c='Open',Type__c='Crafts',Start_Time__c=Datetime.valueof('2014-09-15 15:00:00'),End_Time__c=Datetime.valueof('2014-09-15 16:00:00')));
        wkshops.add(new Workshop__c(Name='Russion for Business',Room__c=rms[2].Id,Status__c='Planning',Type__c='Adult Education',Start_Time__c=Datetime.valueof('2014-10-15 15:00:00'),End_Time__c=Datetime.valueof('2014-10-15 16:00:00')));
        wkshops.add(new Workshop__c(Name='Yo-Zumba',Room__c=rms[3].Id,Status__c='Complete',Type__c='Health and Wellbeing',Start_Time__c=Datetime.valueof('2014-11-15 15:00:00'),End_Time__c=Datetime.valueof('2014-11-15 16:00:00')));
        wkshops.add(new Workshop__c(Name='Movie Night',Status__c='Planning',Type__c='Culture',Start_Time__c=Datetime.valueof('2014-12-15 15:00:00'),End_Time__c=Datetime.valueof('2014-12-15 16:00:00')));
        wkshops.add(new Workshop__c(Name='Knitting Nutters',Status__c='Cancelled',Type__c='Crafts',Start_Time__c=Datetime.valueof('2014-02-15 16:00:00'),End_Time__c=Datetime.valueof('2014-02-15 17:00:00')));
        wkshops.add(new Workshop__c(Name='Introduction to Force.com',Room__c=rms[5].Id,Status__c='Open',Type__c='Adult Education',Start_Time__c=Datetime.valueof('2014-03-15 16:00:00'),End_Time__c=Datetime.valueof('2014-03-15 17:00:00')));
        wkshops.add(new Workshop__c(Name='Yogalicious',Room__c=rms[6].Id,Status__c='Planning',Type__c='Health and Wellbeing',Start_Time__c=Datetime.valueof('2014-04-15 16:00:00'),End_Time__c=Datetime.valueof('2014-04-15 17:00:00')));
        wkshops.add(new Workshop__c(Name='Dance Appreciation',Room__c=rms[7].Id,Status__c='Complete',Type__c='Culture',Start_Time__c=Datetime.valueof('2014-05-15 16:00:00'),End_Time__c=Datetime.valueof('2014-05-15 17:00:00')));
        wkshops.add(new Workshop__c(Name='Macramé',Room__c=rms[8].Id,Status__c='Open',Type__c='Crafts',Start_Time__c=Datetime.valueof('2014-06-15 16:00:00'),End_Time__c=Datetime.valueof('2014-07-15 17:00:00')));
        wkshops.add(new Workshop__c(Name='Introduction to Force.com',Room__c=rms[9].Id,Status__c='Planning',Type__c='Adult Education',Start_Time__c=Datetime.valueof('2014-07-15 16:00:00'),End_Time__c=Datetime.valueof('2014-07-15 17:00:00')));
        
        insert wkshops;
        
        //add a single room with no workshops
        Room__c r = new Room__c(Name='Oak 1');
        insert r; 
    }
    
    public static void wipe(){
        List<Workshop__c> wkshops = [select Id from Workshop__c]; 
        delete wkshops;
        List<Room__c> rms = [select Id from Room__c]; 
        delete rms; 
    }

}