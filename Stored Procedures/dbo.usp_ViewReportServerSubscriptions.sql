SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_ViewReportServerSubscriptions] 
	
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT
			Schedule.ScheduleID AS SQLAgent_Job_Name
		   ,Subscriptions.Description AS sub_desc
		   ,Subscriptions.DeliveryExtension AS sub_delExt
		   ,[Catalog].Name AS ReportName
		   ,[Catalog].Path AS ReportPath
		FROM
			ReportServer.dbo.ReportSchedule
			INNER JOIN ReportServer.dbo.Schedule
			ON ReportServer.dbo.ReportSchedule.ScheduleID = ReportServer.dbo.Schedule.ScheduleID
			INNER JOIN ReportServer.dbo.Subscriptions
			ON ReportSchedule.SubscriptionID = Subscriptions.SubscriptionID
			INNER JOIN ReportServer.dbo.[Catalog]
			ON ReportSchedule.ReportID = [Catalog].ItemID
			   AND Subscriptions.Report_OID = [Catalog].ItemID
END
GO
