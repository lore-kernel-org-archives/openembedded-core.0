Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 34FE772491
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 21:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SLgSBW028720; Tue, 28 Apr 2015 22:42:28 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BMdOc0ilziC1; Tue, 28 Apr 2015 22:42:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3SLgDIG028716
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 28 Apr 2015 22:42:24 +0100
Message-ID: <1430257333.13022.247.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
Date: Tue, 28 Apr 2015 22:42:13 +0100
In-Reply-To: <1430257073.5364.1.camel@bottazzini-ThinkPad-T430>
References: <1430251922-28699-1-git-send-email-ross.burton@intel.com>
	<20150428213007.GC2322@jama>
	<1430257073.5364.1.camel@bottazzini-ThinkPad-T430>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: bring back the patch to customise root's $HOME
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
X-List-Received-Date: Tue, 28 Apr 2015 21:42:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-04-28 at 18:37 -0300, Bottazzini, Bruno wrote:
> Thanks Ross!
> 
> This slipped trough my fingers when I have remade the first version to
> use the stable branch.
> 
> Martin,
> 
> The patch removed will be applied automatically because they are
> upstreamed on the stable branch.

We have a load of unused orphan patch files left in the tree though?
These need to be removed.

Cheers,

Richard


