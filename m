Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta8.messagelabs.com (mail1.bemta8.messagelabs.com
	[216.82.243.200])
	by mail.openembedded.org (Postfix) with ESMTP id 455D0601B8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 18:33:34 +0000 (UTC)
Received: from [216.82.241.196] by server-8.bemta-8.messagelabs.com id
	91/EA-03498-F7C60E65; Wed, 09 Mar 2016 18:33:35 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-16.tower-46.messagelabs.com!1457548414!19259166!1
X-Originating-IP: [192.109.95.98]
X-StarScan-Received: 
X-StarScan-Version: 8.11; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25939 invoked from network); 9 Mar 2016 18:33:34 -0000
Received: from unknown (HELO DOR-VMS-XCH01.digi.com) (192.109.95.98)
	by server-16.tower-46.messagelabs.com with SMTP;
	9 Mar 2016 18:33:34 -0000
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by DOR-VMS-XCH01.digi.com
	(10.49.8.98) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Wed, 9 Mar 2016 19:33:24 +0100
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Wed, 9 Mar 2016 19:33:22 +0100
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1456337541-4269-1-git-send-email-javier.viguera@digi.com>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <56E06C6D.5020008@digi.com>
Date: Wed, 9 Mar 2016 19:33:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1456337541-4269-1-git-send-email-javier.viguera@digi.com>
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
X-KSE-AntiSpam-Interceptor-Info: protection disabled
Subject: Re: [PATCH] bluez5: allow D-Bus to spawn obexd in systems without systemd
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
X-List-Received-Date: Wed, 09 Mar 2016 18:33:36 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 24/02/16 19:12, Javier Viguera wrote:
> This includes a proper D-Bus service file for obexd in systems that do
> not support systemd.
>
> Signed-off-by: Javier Viguera <javier.viguera-i7dp0qKlBMg@public.gmane.org>

Ping.

-- 
Thanks,

Javier Viguera

