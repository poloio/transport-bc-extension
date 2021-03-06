table 50105 Route
{
    Caption = 'Ruta de envío';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Number"; Integer)
        {
            Caption = 'Número';
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(10; "Order Code"; Code[20])
        {
            Caption = 'Cod. Ped. Venta';
            TableRelation = "Sales Header";
            DataClassification = ToBeClassified;
        }
        field(2; "Driver Employee Code"; Code[10])
        {
            Caption = 'Cod. Conductor';
            TableRelation = Employee WHERE("License Type" = field("Needed Lic."));
            DataClassification = ToBeClassified;
        }
        field(3; "Vehicle Code"; Code[7])
        {
            Caption = 'Cod. Vehículo';
            TableRelation = Vehicle;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                CalcFields("Needed Lic.");
            end;
        }

        field(9; "Needed Lic."; Code[5])
        {
            Caption = 'Perm. Necesario';
            FieldClass = FlowField;
            CalcFormula = lookup(Vehicle."License Type" where("Plate Code" = field("Vehicle Code")));
        }

        field(4; "Pick-up Province"; Code[3])
        {
            Caption = 'Provincia de origen';
            TableRelation = Province;
            DataClassification = ToBeClassified;
        }

        field(5; "Pick-up Address"; Text[100])
        {
            Caption = 'Dirección de recogida';
            DataClassification = ToBeClassified;
        }

        field(6; "Delivery Province"; Code[3])
        {
            Caption = 'Provincia de destino';
            TableRelation = Province;
            DataClassification = ToBeClassified;
        }

        field(7; "Delivery Address"; Text[100])
        {
            Caption = 'Dirección de entrega';
            DataClassification = ToBeClassified;
        }

        field(8; Distance; Integer)
        {
            Caption = 'Distancia (Km)';
            DataClassification = ToBeClassified;
        }
        field(11; "Departure Time"; DateTime)
        {
            Caption = 'Fecha/hora salida';
            DataClassification = ToBeClassified;
        }
        field(14; "Delivery Note Code"; Code[20])
        {
            Caption = 'Cod. Albarán';
            TableRelation = "Sales Shipment Header";
            DataClassification = ToBeClassified;
        }
        field(12; "Delivery Time"; DateTime)
        {
            Caption = 'Fecha/hora entrega';
            DataClassification = ToBeClassified;
        }
        field(13; "Return Time"; DateTime)
        {
            Caption = 'Fecha/hora llegada';
            DataClassification = ToBeClassified;
        }
        field(15; "Fuel Cost"; Decimal)
        {
            Caption = 'Coste carburante';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Number")
        {
            Clustered = true;
        }
    }
}
