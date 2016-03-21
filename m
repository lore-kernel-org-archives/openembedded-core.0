Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.194])
	by mail.openembedded.org (Postfix) with ESMTP id 76C4E612E5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 11:36:27 +0000 (UTC)
Received: from [216.82.242.35] by server-2.bemta-8.messagelabs.com id
	C2/2D-17843-BBCDFE65; Mon, 21 Mar 2016 11:36:27 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-5.tower-75.messagelabs.com!1458560186!14832109!1
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 8.11; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 84857 invoked from network); 21 Mar 2016 11:36:27 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-5.tower-75.messagelabs.com with SMTP;
	21 Mar 2016 11:36:27 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by DOR-VMS-XCH01.digi.com
	(10.49.8.98) with Microsoft SMTP Server (TLS) id 14.3.279.2;
	Mon, 21 Mar 2016 12:36:20 +0100
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.279.2;
	Mon, 21 Mar 2016 12:36:19 +0100
References: <1456337679-4602-1-git-send-email-javier.viguera@digi.com>
	<1457003268.3025.9.camel@linux.intel.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB790570@dor-sms-xch01.digi.com>
	<1457004633.3025.13.camel@linux.intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, <joshua.g.lock@linux.intel.com>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <56EFDCAC.6080806@digi.com>
Date: Mon, 21 Mar 2016 12:36:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1457004633.3025.13.camel@linux.intel.com>
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
X-KSE-AntiSpam-Interceptor-Info: protection disabled
Subject: Re: [jethro][PATCH] bluez5: allow D-Bus to spawn obexd in systems without systemd
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
X-List-Received-Date: Mon, 21 Mar 2016 11:36:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Joshua

On 03/03/16 12:30, Joshua G Lock wrote:
>
> Ah, I hadn't seen that patch as I was only looking at patches tagged
> jethro. We can consider this change for jethro once it lands in master.
>

This has been finally merged into master.

Would you now consider cherry-picking it into *jethro* ?

Thanks,

Javier Viguera

