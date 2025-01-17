namespace Microsoft.Bank.PayPal;

#if not CLEAN21
using System.Security.AccessControl;

permissionsetextension 6559 "M365 COLLABORATION - PayPal Payments Standard" extends "M365 COLLABORATION"
{
    Permissions = tabledata "MS - PayPal Standard Account" = R,
                  tabledata "MS - PayPal Standard Template" = R,
                  tabledata "MS - PayPal Transaction" = R;
}
#endif