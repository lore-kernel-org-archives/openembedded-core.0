Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A5A786E7D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 09:21:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1J9LdwO008477
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Feb 2014 01:21:39 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 19 Feb 2014 01:21:38 -0800
Message-ID: <530477A1.2050704@windriver.com>
Date: Wed, 19 Feb 2014 17:21:37 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, OE-core
	<openembedded-core@lists.openembedded.org>
References: <CAJTo0LYip7WYGCqepC9ooxD=ZosM2_BSO1jCO73AwbXXUTA7Yw@mail.gmail.com>
In-Reply-To: <CAJTo0LYip7WYGCqepC9ooxD=ZosM2_BSO1jCO73AwbXXUTA7Yw@mail.gmail.com>
Subject: Re: [dora] grub: move xz to DEPENDS list from RDEPENDS
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
X-List-Received-Date: Wed, 19 Feb 2014 09:21:40 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Ross,

Thanks, I will port it.

// Robert

On 02/18/2014 12:14 AM, Burton, Ross wrote:
> Hi Robert,
>
> Can you backport this commit from master to Dora:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit?id=d9da9cb7b345ef7ea732264bde8096a0d113f405
>
> Just had to debug a session for someone who was hit by this.
>
> Ross
>
>

