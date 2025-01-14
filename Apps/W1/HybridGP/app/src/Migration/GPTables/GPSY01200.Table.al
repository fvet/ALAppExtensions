namespace Microsoft.DataMigration.GP;

table 40135 "GP SY01200"
{
    DataClassification = CustomerContent;
    fields
    {
        field(1; Master_Type; Text[3])
        {
            DataClassification = CustomerContent;
        }
        field(2; Master_ID; Text[31])
        {
            DataClassification = CustomerContent;
        }
        field(3; ADRSCODE; Text[15])
        {
            DataClassification = CustomerContent;
        }
        field(4; INET1; Text[201])
        {
            DataClassification = CustomerContent;
        }
        field(5; INET2; Text[201])
        {
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(Key1; Master_Type, Master_ID, ADRSCODE)
        {
            Clustered = true;
        }
    }
}

