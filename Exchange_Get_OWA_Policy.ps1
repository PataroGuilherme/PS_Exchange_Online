### PowerShell:
Connect-ExchangeOnline

Get-OWAMailboxPolicy -Identity "OwaMailboxPolicy-Default" | Format-List


WacEditingEnabled                                    : True
PrintWithoutDownloadEnabled                          : True
OneDriveAttachmentsEnabled                           : True
ThirdPartyFileProvidersEnabled                       : False
AdditionalStorageProvidersAvailable                  : True
ClassicAttachmentsEnabled                            : True
ReferenceAttachmentsEnabled                          : True
SaveAttachmentsToCloudEnabled                        : True
InternalSPMySiteHostURL                              : 
ExternalSPMySiteHostURL                              : 
ExternalImageProxyEnabled                            : True
NpsSurveysEnabled                                    : True
MessagePreviewsDisabled                              : False
PersonalAccountCalendarsEnabled                      : True
TeamsnapCalendarsEnabled                             : True
BookingsMailboxCreationEnabled                       : True
BookingsMailboxDomain                                : 
ProjectMocaEnabled                                   : False
DirectFileAccessOnPublicComputersEnabled             : True
DirectFileAccessOnPrivateComputersEnabled            : True
WebReadyDocumentViewingOnPublicComputersEnabled      : True
WebReadyDocumentViewingOnPrivateComputersEnabled     : True
ForceWebReadyDocumentViewingFirstOnPublicComputers   : False
ForceWebReadyDocumentViewingFirstOnPrivateComputers  : False
WacViewingOnPublicComputersEnabled                   : True
WacViewingOnPrivateComputersEnabled                  : True
ForceWacViewingFirstOnPublicComputers                : False
ForceWacViewingFirstOnPrivateComputers               : False
ActionForUnknownFileAndMIMETypes                     : Allow
WebReadyFileTypes                                    : {.xlsx, .pptx, .docx, .xlsÔÇª}
WebReadyMimeTypes                                    : {application/vnd.openxmlformats-officedocument.presentationml.presentation, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-powerpointÔÇª}
WebReadyDocumentViewingForAllSupportedTypes          : True
WebReadyDocumentViewingSupportedMimeTypes            : {application/msword, application/vnd.ms-excel, application/x-msexcel, application/vnd.ms-powerpointÔÇª}
WebReadyDocumentViewingSupportedFileTypes            : {.doc, .dot, .rtf, .xlsÔÇª}
AllowedFileTypes                                     : {.rpmsg, .xlsx, .xlsm, .xlsbÔÇª}
AllowedMimeTypes                                     : {image/jpeg, image/png, image/gif, image/bmp}
ForceSaveFileTypes                                   : {.svgz, .html, .xml, .swfÔÇª}
ForceSaveMimeTypes                                   : {Application/x-shockwave-flash, Application/octet-stream, Application/futuresplash, Application/x-directorÔÇª}
BlockedFileTypes                                     : {.settingcontent-ms, .printerexport, .appcontent-ms, .applicationÔÇª}
BlockedMimeTypes                                     : {application/x-javascript, application/javascript, application/msaccess, x-internet-signupÔÇª}
FeedbackEnabled                                      : True
SMimeSuppressNameChecksEnabled                       : False
EmptyStateEnabled                                    : True
BizBarEnabled                                        : True
AccountTransferEnabled                               : True
OfflineEnabledWeb                                    : True
OfflineEnabledWin                                    : True
MonthlyUpdatesEnabled                                : True
OneWinNativeOutlookEnabled                           : 
PersonalAccountsEnabled                              : 
AdditionalAccountsEnabled                            : 
ChangeSettingsAccountEnabled                         : 
ItemsToOtherAccountsEnabled                          : 
AllowedOrganizationAccountDomains                    : 
HideClassicOutlookToggleOut                          : 
OutlookDataFile                                      : Allow
PhoneticSupportEnabled                               : False
DefaultTheme                                         : 
IsDefault                                            : True
DefaultClientLanguage                                : 0
LogonAndErrorLanguage                                : 0
UseGB18030                                           : False
UseISO885915                                         : False
OutboundCharset                                      : AutoDetect
GlobalAddressListEnabled                             : True
OrganizationEnabled                                  : True
ExplicitLogonEnabled                                 : True
OWALightEnabled                                      : True
DelegateAccessEnabled                                : True
IRMEnabled                                           : True
CalendarEnabled                                      : True
ContactsEnabled                                      : True
TasksEnabled                                         : True
JournalEnabled                                       : True
NotesEnabled                                         : True
OnSendAddinsEnabled                                  : False
RemindersAndNotificationsEnabled                     : True
PremiumClientEnabled                                 : True
SpellCheckerEnabled                                  : True
SearchFoldersEnabled                                 : True
SignaturesEnabled                                    : True
ThemeSelectionEnabled                                : True
JunkEmailEnabled                                     : True
UMIntegrationEnabled                                 : True
WSSAccessOnPublicComputersEnabled                    : True
WSSAccessOnPrivateComputersEnabled                   : True
ChangePasswordEnabled                                : True
UNCAccessOnPublicComputersEnabled                    : True
UNCAccessOnPrivateComputersEnabled                   : True
ActiveSyncIntegrationEnabled                         : True
AllAddressListsEnabled                               : True
RulesEnabled                                         : True
PublicFoldersEnabled                                 : True
SMimeEnabled                                         : True
RecoverDeletedItemsEnabled                           : True
InstantMessagingEnabled                              : True
TextMessagingEnabled                                 : True
ForceSaveAttachmentFilteringEnabled                  : False
SilverlightEnabled                                   : True
InstantMessagingType                                 : Ocs
DisplayPhotosEnabled                                 : True
SetPhotoEnabled                                      : True
AllowOfflineOn                                       : AllComputers
SetPhotoURL                                          : 
PlacesEnabled                                        : True
WeatherEnabled                                       : True
LocalEventsEnabled                                   : False
InterestingCalendarsEnabled                          : True
AllowCopyContactsToDeviceAddressBook                 : True
PredictedActionsEnabled                              : False
UserDiagnosticEnabled                                : False
FacebookEnabled                                      : True
LinkedInEnabled                                      : True
WacExternalServicesEnabled                           : True
WacOMEXEnabled                                       : False
ReportJunkEmailEnabled                               : True
GroupCreationEnabled                                 : True
SkipCreateUnifiedGroupCustomSharepointClassification : True
WebPartsFrameOptionsType                             : SameOrigin
UserVoiceEnabled                                     : True
SatisfactionEnabled                                  : True
FreCardsEnabled                                      : True
ConditionalAccessPolicy                              : Off
ConditionalAccessFeatures                            : {}
OutlookBetaToggleEnabled                             : True
ShowOnlineArchiveEnabled                             : True
OutlookNewslettersAccessLevel                        : Undefined
OutlookNewslettersReactions                          : Undefined
OutlookNewslettersShowMore                           : Undefined
AdminDisplayName                                     : 
ExchangeVersion                                      : 0.10 (14.0.100.0)
Name                                                 : OwaMailboxPolicy-Default
DistinguishedName                                    : CN=OwaMailboxPolicy-Default,CN=OWA Mailbox Policies,CN=Configuration,CN=pluxeegroup.onmicrosoft.com,CN=ConfigurationUnits,DC=FRAP264A009,DC=PROD,DC=OUTLOOK,DC=COM
Identity                                             : OwaMailboxPolicy-Default
ObjectCategory                                       : FRAP264A009.PROD.OUTLOOK.COM/Configuration/Schema/ms-Exch-OWA-Mailbox-Policy
ObjectClass                                          : {top, msExchRecipientTemplate, msExchOWAMailboxPolicy}
WhenChanged                                          : 26/02/2025 07:39:35
WhenCreated                                          : 26/02/2025 07:38:42
WhenChangedUTC                                       : 26/02/2025 10:39:35
WhenCreatedUTC                                       : 26/02/2025 10:38:42
ExchangeObjectId                                     : be5b1524-73b6-42c7-9e5b-16249f2a7878
OrganizationalUnitRoot                               : pluxeegroup.onmicrosoft.com
OrganizationId                                       : FRAP264A009.PROD.OUTLOOK.COM/Microsoft Exchange Hosted Organizations/pluxeegroup.onmicrosoft.com - FRAP264A009.PROD.OUTLOOK.COM/ConfigurationUnits/pluxeegroup.onmicrosoft.com/Configuration
Id                                                   : OwaMailboxPolicy-Default
Guid                                                 : bd49fc3a-e8ef-4d39-86fc-a6663d2864b7
OriginatingServer                                    : PA7P264A09DC001.FRAP264A009.PROD.OUTLOOK.COM
IsValid                                              : True
ObjectState                                          : Unchanged

