Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 01FDA770EF
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Aug 2016 21:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u77LJuxT005360; Sun, 7 Aug 2016 22:19:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id smxfV_L6Pg-a; Sun,  7 Aug 2016 22:19:56 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u77LJrst005357
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 7 Aug 2016 22:19:54 +0100
Message-ID: <1470604793.8166.21.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nobuhiro Iwamatsu <iwamatsu@debian.org>,
	openembedded-core@lists.openembedded.org
Date: Sun, 07 Aug 2016 22:19:53 +0100
In-Reply-To: <1470581318-33390-1-git-send-email-iwamatsu@debian.org>
References: <1470581318-33390-1-git-send-email-iwamatsu@debian.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] mmc-utils: update to latest git revision
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
X-List-Received-Date: Sun, 07 Aug 2016 21:20:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-08-07 at 23:48 +0900, Nobuhiro Iwamatsu wrote:
> From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> 
> This commit update to latest git revision and add SRCPV to PV.

Why do we need a git revision of this rather than a released version?

Cheers,

Richard


