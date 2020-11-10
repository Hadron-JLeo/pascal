
// ################################# //
// ###### VARIABLE DEFINITION ###### //
//
type	
tRefIndexListe= ^ tIndexListe;
tIndexListe= record
               index: integer;
               wort: string;
               next: tRefIndexListe
             end;
//
// #################################


// ##### PROCEDURE "ADD" DECLARATION ##### //
//
procedure add(var ioListe:tRefIndexListe; inIndex:integer; inWert:String);
    {
        This procedure adds a node into an already existing dynamic list
    }

    // Initialising variables -------
    knoten_einsetzen: tRefIndexListe;
    //
    gegebene_liste: tRefIndexListe;
    //
    nach_knoten: tRefIndexListe; // Knoten Nach dem Knoten der einzusetzen ist
    // 
    // ##############################

    cur_index: integer;

    begin
        gegebene_liste:= ioListe;
        new(knoten_einsetzen);
        knoten_einsetzen^.index:= inIndex;
        knoten_einsetzen^.wort:= inWert;
        knoten_einsetzen^.next = nil;

        nach_knoten:= nil;
        cur_index:= knoten_einsetzen^.index;

        
        while (gegebene_liste <> nil) do
            begin
                //gegebene_liste:= gegebene_liste^.next;
                if NOT (knoten_einsetzen^.index < 0) then
                    begin
                        Writeln("Nur Zahlen groesser 0");
                        Break;
                    end
                else
                    begin
                        
                        if ((gegebene_liste^.index = knoten_einsetzen^.index) AND (nach_knoten=nil)) then
                            nach_knoten:= gegebene_liste; // Wenn der jetzige Index aequivalent zu dem des neuen Knotens ist,
                            // neuen Knoten an der Stelle dranhaengen
                            gegebene_liste:= ioListe;
                            Continue;
                        
                        if ((gegebene_liste^.index = (knoten_einsetzen^.index-1)) AND (nach_knoten <> nil))  then
                            knoten_einsetzen^.next:= nach_knoten; // Naechste Stelle des neuen Knotens ist alter Knoten der selben Stelle
                            gegebene_liste^.next:= knoten_einsetzen; // Neuen Knoten dranhaengen
                            Break;

                        gegebene_liste:=gegebene_liste^.next;
                        
                    end;
            end; 


        dispose(knoten_einsetzen); // Speicher wieder freimachen, Object loeschen.
        
    end;

// ##### PROCEDURE "ADD" END ############# //
// ======================================= //