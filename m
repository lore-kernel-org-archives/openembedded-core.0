Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9C62660043
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 18:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u88IhvbJ003981; Thu, 8 Sep 2016 19:43:57 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ljSg4HMKtm69; Thu,  8 Sep 2016 19:43:57 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u88IhqJ4003976
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 8 Sep 2016 19:43:53 +0100
Message-ID: <1473360232.20226.243.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 08 Sep 2016 19:43:52 +0100
In-Reply-To: <CADkTA4P38YNhAtSQE_TJApsqOYffmJTJxXm27S6yBQRmBJiLpQ@mail.gmail.com>
References: <cover.1473296553.git.bruce.ashfield@windriver.com>
	<4d4a31993e794fe69a20600966a7ffb01d1c1245.1473296553.git.bruce.ashfield@windriver.com>
	<CADkTA4P38YNhAtSQE_TJApsqOYffmJTJxXm27S6yBQRmBJiLpQ@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] linux-yocto: update to 4.8-rc5
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
X-List-Received-Date: Thu, 08 Sep 2016 18:43:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-09-08 at 14:17 -0400, Bruce Ashfield wrote:
> I forgot to bump the LINUX_VERSION on this patch. I can send an
> incremental change
> or amend this one. Which is preferred ?

It already merged so against master please.

(and I can confirm the build performance looks much better thanks!)

Cheers,

Richard

