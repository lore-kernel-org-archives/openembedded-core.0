Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D947B73710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 21:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6ALPlow027730; Fri, 10 Jul 2015 22:25:47 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Zwnrr-6kiTzi; Fri, 10 Jul 2015 22:25:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6ALPXf6027717
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 10 Jul 2015 22:25:44 +0100
Message-ID: <1436563533.3310.17.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Amarnath Valluri <amarnath.valluri@intel.com>
Date: Fri, 10 Jul 2015 22:25:33 +0100
In-Reply-To: <1436530992-13161-1-git-send-email-amarnath.valluri@intel.com>
References: <1436530992-13161-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] mc: Upgrade to release 4.8.14
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
X-List-Received-Date: Fri, 10 Jul 2015 21:25:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-07-10 at 15:23 +0300, Amarnath Valluri wrote:
> Dropped mc-CTRL.patch, as it was merged to upstream.
> Upstream commit-id: e78b636eba9d23e9f5f066b022bd5640c85409be.

mc-CTRL.patch is still used by the non-gplv3 recipe?

https://autobuilder.yoctoproject.org/main/builders/nightly-non-gpl3/builds/391/steps/BuildImages/logs/stdio

Cheers,

Richard


