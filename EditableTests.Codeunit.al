codeunit 50140 "AVI Editable Tests"
{
    Subtype = Test;

    [Test]
    procedure CheckIfNotPossibleToChangeStartingDateInReleasedStatus()
    var
        AVIBonusHeader: Record "AVI Bonus Header";
    begin
        //[Scenario] Check if Not possible to change starting date in Released Status
        //[Given] Bonus Header exists in status released.
        AVIBonusHeader.init();
        AVIBonusHeader."No." := LibraryUtility.GetGlobalNoSeriesCode();
        AVIBonusHeader.Status := AVIBonusHeader.Status::Released;
        AVIBonusHeader.Insert();

        //[When] Validate the Starting Date directly in the code
        asserterror AVIBonusHeader.Validate("Starting Date", LibraryRandom.RandDate(10));
        //[Then] Error is shown that you cannot change the Starting Date in Released status
        Assert.ExpectedError('Status must be equal to ''Open''');
    end;

    var
        LibraryUtility: Codeunit "Library - Utility";
        LibraryRandom: Codeunit "Library - Random";
        Assert: Codeunit Assert;

}