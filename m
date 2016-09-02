Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F369C60670
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 11:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u82BfZ2w006675; Fri, 2 Sep 2016 12:41:35 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3spf7wqx0Mj2; Fri,  2 Sep 2016 12:41:35 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u82BfVq6006672
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 2 Sep 2016 12:41:32 +0100
Message-ID: <1472816491.29583.154.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Fri, 02 Sep 2016 12:41:31 +0100
In-Reply-To: <57C8DBBD.7020701@windriver.com>
References: <1472178349-32199-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0Lajz4nb5S5T4rq=F6fmfGvRPEuAyKF=U-OZdWfo+JoOqQ@mail.gmail.com>
	<57C00BB4.8050607@windriver.com> <57C8DBBD.7020701@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] groff: add file-homedir-perl to RDEPENDS
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
X-List-Received-Date: Fri, 02 Sep 2016 11:41:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-09-02 at 09:54 +0800, Yu, Mingli wrote:
> ping

I'm with Ross here. We don't often have need for sheet music conversion
in groff in embedded or IoT devices. I'd prefer to have configuration
to disable this.

Cheers,

Richard

