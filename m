Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 5E4CC6012A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 00:55:26 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3q0N1B58XDz3hhsl;
	Wed, 10 Feb 2016 01:55:25 +0100 (CET)
X-Auth-Info: eExRI29s6InmRZ9VQUroXljBRGOV93jLBx9el5gqtcc=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3q0N186QZSzvdWS; 
	Wed, 10 Feb 2016 01:55:24 +0100 (CET)
Message-ID: <56BA8A7C.5060400@denx.de>
Date: Wed, 10 Feb 2016 01:55:24 +0100
From: Marek Vasut <marex@denx.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1455062646-12311-1-git-send-email-marex@denx.de>
	<1455062646-12311-3-git-send-email-marex@denx.de>
In-Reply-To: <1455062646-12311-3-git-send-email-marex@denx.de>
Subject: Re: [PATCH 3/7] dpkg: Update to 1.18.4
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
X-List-Received-Date: Wed, 10 Feb 2016 00:55:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 02/10/2016 01:04 AM, Marek Vasut wrote:
> Update dpkg version to 1.18.4 . This adds nios2 architecture support
> among other fixes. One patch was updated so it would apply to 1.18.4.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Ross Burton <ross.burton@intel.com>

Looks like I will have to do a V2 of this dpkg patch, please skip this
one and I will repost it after I do one more rebuild. The other patches
should be fine.


