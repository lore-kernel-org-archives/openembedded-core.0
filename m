Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 53DA665CBB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 15:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0PFJAQB014378; Mon, 25 Jan 2016 15:19:17 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id D_LB-LBL3jh8; Mon, 25 Jan 2016 15:19:17 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0PFJClO014395
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 25 Jan 2016 15:19:13 GMT
Message-ID: <1453735152.25948.14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>,
	openembedded-core@lists.openembedded.org, "Belal, Awais"
	<Awais_Belal@mentor.com>
Date: Mon, 25 Jan 2016 15:19:12 +0000
In-Reply-To: <56A63611.8050505@linux.intel.com>
References: <1446210513-16152-1-git-send-email-awais_belal@mentor.com>
	<2021B186DC632746BD5A3CE32F12BD280119A934F7@EU-MBX-02.mgc.mentorg.com>
	<56A63611.8050505@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [RFC][PATCH] python: ensure usage of host modules while cross compiling
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
X-List-Received-Date: Mon, 25 Jan 2016 15:19:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-01-25 at 08:49 -0600, Alejandro Hernandez wrote:
> Ping
> 
> This has been here for a while now, if it doesnt apply let me know
> and I 
> will rebase this, this fixes bug 8671.

Wasn't this fixed by:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=a1fa8d9ac53625737aab29b4e5e1687fc01bdfc2

?

Cheers,

Richard


