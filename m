Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 19745701A6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 12:46:33 +0000 (UTC)
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3hV5t20h0nz3hj33;
	Fri,  8 Aug 2014 14:46:34 +0200 (CEST)
X-Auth-Info: Cud+PwrAGt24EY/DjgExKU3zO2G6JPpjY09xI0gqYAI=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3hV5t205jXz7S6SZ; 
	Fri,  8 Aug 2014 14:46:34 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 8 Aug 2014 14:22:19 +0200
User-Agent: KMail/1.13.7 (Linux/3.13-trunk-amd64; KDE/4.13.1; x86_64; ; )
References: <1407438629-13369-1-git-send-email-marex@denx.de>
	<3FD4F336-0653-4641-899F-DDD2AF178A20@dominion.thruhere.net>
In-Reply-To: <3FD4F336-0653-4641-899F-DDD2AF178A20@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201408081422.19749.marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Yocto: Install full set of python modules in Qt SDK toolchain
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
X-List-Received-Date: Fri, 08 Aug 2014 12:46:37 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Friday, August 08, 2014 at 07:22:04 AM, Koen Kooi wrote:
> Since 'yocto' is a project like freedesktop.org your commit message doesn't
> make sense, it should be something like:
> 
> meta-toolchain-qt:  Install full set of python modules

Got it, Saul also told me so. I will wait a bit for some more feedback and 
repost with corrections, OK ? Is this approach I took here even correct please ?

Best regards,
Marek Vasut

