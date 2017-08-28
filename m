Return-Path: <Javier.Viguera@digi.com>
X-Greylist: delayed 416 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 28 Aug 2017 15:47:55 UTC
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.2])
	by mail.openembedded.org (Postfix) with ESMTP id 11E1978228
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 15:47:55 +0000 (UTC)
Received: from [216.82.249.147] by server-2.bemta-12.messagelabs.com id
	21/D5-01994-D8934A95; Mon, 28 Aug 2017 15:41:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleJIrShJLcpLzFFi42Jx8l0noNtjuST
	SYOt1I4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePv/L8sBe4VB6f2sTUwWnYxcnEICaxmlDj+
	/BsThLOGUWLdmqdsEM5iRokvG46ydzFycggLOEs82TeLsYuRg0NEQE/i6j9RkLCQgI3E0Tkfw
	ErYgMKTLz1hBrF5BawlOr48ZAEpZxFQlXhyOBgkLCoQLrH/+zWoEkGJkzOfsIDYnAK2Evs/vG
	UCsZkFLCRmzj/PCGGLS9x6Mh8qLi+x/e0cZoi1KhIHl14Gq5EAim/afJYdwjaRuHh1NxuEbSj
	xfdY3FghbWmJv30LmCYwis5CsnoVk3Swk62YhWbeAkWUVo0ZxalFZapGuiaFeUlFmekZJbmJm
	jq6hoZFebmpxcWJ6ak5iUrFecn7uJkZgTNQzMDDuYHyzP/oQoyQHk5Io786KxZFCfEn5KZUZi
	cUZ8UWlOanFhxhlODiUJHjjLJZECgkWpaanVqRl5gCjEyYtwcGjJMKbYA6U5i0uSMwtzkyHSJ
	1itOSY92/NFyaOD/9BZNOHLV+YhFjy8vNSpcR5k0HmCYA0ZJTmwY2DJZBLjLJSwryMDAwMQjw
	FqUW5mSWo8q8YxTkYlYR594FM4cnMK4Hb+groICaggxQFF4IcVJKIkJJqYAz5qlN7/LhQ6oKG
	nuhpvJt25GpO08/P29LWr5+yYVK+uP+1l8yp4c90r/tOPLu/87vfD38PozNCqzifpp/SeOewS
	ljFbXL/RvuLZXKGWZwbb365bpYnefLiselcFY1HKnrv1K1dkJXn+cFsWqvmvSTTPdut5HQizd
	snqkdXRh5MUOFYc+56phJLcUaioRZzUXEiACcM/XUbAwAA
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-11.tower-29.messagelabs.com!1503934860!71374049!1
X-Originating-IP: [66.77.174.16]
X-StarScan-Received: 
X-StarScan-Version: 9.4.45; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6304 invoked from network); 28 Aug 2017 15:41:00 -0000
Received: from owa.digi.com (HELO MCL-VMS-XCH01.digi.com) (66.77.174.16)
	by server-11.tower-29.messagelabs.com with SMTP;
	28 Aug 2017 15:41:00 -0000
Received: from MTK-SMS-XCH03.digi.com (10.10.8.197) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 28 Aug 2017 10:40:57 -0500
Received: from DOR-SMS-XCH01.digi.com (10.49.8.99) by MTK-SMS-XCH03.digi.com
	(10.10.8.197) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 28 Aug 2017 10:40:57 -0500
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-xch01.digi.com
	(10.49.8.99) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 28 Aug 2017 17:40:55 +0200
To: <openembedded-core@lists.openembedded.org>
References: <20170718163202.16781-1-javier.viguera@digi.com>
From: Javier Viguera <javier.viguera@digi.com>
Message-ID: <a4aa6da8-b726-dd19-4e40-074b7f9b2a6f@digi.com>
Date: Mon, 28 Aug 2017 17:40:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170718163202.16781-1-javier.viguera@digi.com>
X-Originating-IP: [10.101.2.54]
X-KSE-AntiSpam-Interceptor-Info: protection disabled
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean
Subject: Re: [PATCH] bluez5: cosmetic fixes to bluetooth bootscript
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
X-List-Received-Date: Mon, 28 Aug 2017 15:47:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping?

Please consider merging this for the 2.4 release.

-- jviguera


