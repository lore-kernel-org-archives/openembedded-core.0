Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5D22D6093B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 15:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 2BF0D31C22B8;
	Wed,  7 Dec 2016 16:31:03 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id TDKKIqR-OVzR; Wed,  7 Dec 2016 16:31:00 +0100 (CET)
Received: from [172.22.22.61] (55d40b1f.access.ecotel.net [85.212.11.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id CD81B31C205B;
	Wed,  7 Dec 2016 16:30:59 +0100 (CET)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
	<5106886a-56c8-79f3-bd7a-aee780fd590b@linux.intel.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <fb6aaabe-3c7a-7e56-4e82-f36dd288c366@opendreambox.org>
Date: Wed, 7 Dec 2016 16:30:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <5106886a-56c8-79f3-bd7a-aee780fd590b@linux.intel.com>
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
X-List-Received-Date: Wed, 07 Dec 2016 15:31:02 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Alex,

On 07.12.2016 13:25, Alexander Kanavin wrote:
> On 12/06/2016 01:49 PM, Andreas Oberritter wrote:
>> These are most of my patches which accumulated since our distro
>> switched from opkg to dpkg and apt two years ago. They were tested
>> thoroughly on dora and krogoth and just a little bit on master.
> 
> How about updating apt and dpkg to latest upstream releases at the same
> time?

I don't see an advantage over updating at a later point in time.

Regards,
Andreas


