// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Microsoft.Inventory.Intrastat;

using System.Security.AccessControl;

permissionsetextension 11298 "Intrastat SE - Objects" extends "Intrastat Core - Objects"
{
    Permissions =
        codeunit IntrastatReportManagementSE = X;
}