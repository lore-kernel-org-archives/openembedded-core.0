Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF6671A6A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 16:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 4D8EE31C20AC;
	Tue,  6 Dec 2016 17:00:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id U_Zf_72q3D00; Tue,  6 Dec 2016 17:00:45 +0100 (CET)
Received: from [172.22.22.61] (55d40c51.access.ecotel.net [85.212.12.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 4864F31C21AB;
	Tue,  6 Dec 2016 17:00:45 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
	<CAJTo0La31Co0vhNd6bKwubxMOO_qD=-Uh2yi_oLYCumennVXFg@mail.gmail.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <bbcdeeaa-e2a2-6e2a-e18b-6f93d54b00fb@opendreambox.org>
Date: Tue, 6 Dec 2016 17:00:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0La31Co0vhNd6bKwubxMOO_qD=-Uh2yi_oLYCumennVXFg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/33] Accumulated patches for deb packaging
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
X-List-Received-Date: Tue, 06 Dec 2016 16:00:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 06.12.2016 15:36, Burton, Ross wrote:
> 
> On 6 December 2016 at 11:49, Andreas Oberritter <obi@opendreambox.org
> <mailto:obi@opendreambox.org>> wrote:
> 
>     These are most of my patches which accumulated since our distro
>     switched from opkg to dpkg and apt two years ago. They were tested
>     thoroughly on dora and krogoth and just a little bit on master.
> 
> 
> Is this on a branch somewhere?

I just created a new branch here:

http://git.openembedded.org/openembedded-core-contrib/log/?h=obi/deb

Regards,
Andreas

