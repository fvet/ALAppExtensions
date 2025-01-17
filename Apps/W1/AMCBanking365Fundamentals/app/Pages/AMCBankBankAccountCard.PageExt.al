﻿// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Microsoft.Bank.Payment;

using Microsoft.Bank.BankAccount;

pageextension 20103 "AMC Bank Bank Account Card" extends "Bank Account Card"
{
    ContextSensitiveHelpPage = '304';

    layout
    {
        addAfter("Creditor No.")
        {
            field("Bank Name format"; "AMC Bank Name")
            {
                ApplicationArea = Basic, Suite;
                Importance = Additional;
                ToolTip = 'Specifies your bank''s data format as required by the AMC Banking when you import and export bank files.';
                Visible = IsAMCFundamentalsEnabled;
            }
        }
        addafter("Payment Export Format")
        {
            field("Bank Filename"; "AMC Bank File Name")
            {
                ApplicationArea = Basic, Suite;
                Importance = Additional;
                ToolTip = 'Specifies your bank file name incl. extension. (use %1 in filename to get DateTime as part of filename - if field is blank a Bankname.txt will be used as default filename).';
                Visible = IsAMCFundamentalsEnabled;
            }
        }
    }

    var
        AMCBankingMgt: Codeunit "AMC Banking Mgt.";
        IsAMCFundamentalsEnabled: Boolean;

    trigger OnOpenPage()
    var
    begin
        IsAMCFundamentalsEnabled := AMCBankingMgt.IsAMCFundamentalsEnabled();
    end;

}
