Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.7])
	by mail.openembedded.org (Postfix) with ESMTP id 4AFF065DA3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 11:00:19 +0000 (UTC)
Received: from [216.82.249.131] by server-7.bemta-12.messagelabs.com id
	64/6B-03164-34495F45; Tue, 03 Mar 2015 11:00:19 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-8.tower-28.messagelabs.com!1425380418!32227972!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.13.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24716 invoked from network); 3 Mar 2015 11:00:18 -0000
Received: from mail.mx2.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-8.tower-28.messagelabs.com with RC4-SHA encrypted SMTP;
	3 Mar 2015 11:00:18 -0000
Received: from MTK-SMS-XCH02.digi.com (10.10.8.196) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.389.2;
	Tue, 3 Mar 2015 05:00:31 -0600
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MTK-SMS-XCH02.digi.com
	(10.10.8.196) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 3 Mar 2015 05:00:17 -0600
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 3 Mar 2015 12:00:15 +0100
Message-ID: <54F59438.1070304@digi.com>
Date: Tue, 3 Mar 2015 12:00:08 +0100
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1424177294-41586-1-git-send-email-javier.viguera@digi.com>
	<54ECB8AB.1090709@digi.com>
In-Reply-To: <54ECB8AB.1090709@digi.com>
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: Re: [backport][dizzy][daisy] utils.bbclass: fix create_cmdline_wrapper
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Mar 2015 11:00:23 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 24/02/15 18:45, Javier Viguera wrote:
> Hi all,
>
> I see this patch was merged into master. Thanks for that.
>
> Could it be backported to Daisy and Dizzy?
>
> A cherry-pick of the commit in master should apply just fine.

Ping.

Master commit: 49ab89eb9f83388e99069a4b53bdc4cba22bb6f3

-
Regards,

Javier Viguera

