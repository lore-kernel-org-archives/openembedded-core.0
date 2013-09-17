Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 97D5C6158F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 11:18:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8HBIHBm021527
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Sep 2013 04:18:17 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 17 Sep 2013 04:18:17 -0700
Message-ID: <52383A76.3050802@windriver.com>
Date: Tue, 17 Sep 2013 19:18:14 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1379329974.git.hongxu.jia@windriver.com>
	<dd0104c4f2811038c1ee78605e6b81a50045f5f6.1379329974.git.hongxu.jia@windriver.com>
	<C187B0ED-19E6-47C1-AD22-CF80F1EC19B3@gmail.com>
	<5237C039.4080001@windriver.com>
	<CAJTo0LaL_rxVQRdd8r1dkG5zV5FFLk5xBnWP34ME4P2oxu=Gnw@mail.gmail.com>
	<5238389F.1080201@windriver.com>
	<CAJTo0LYBX61vhMN81bk_A-_ahWB8kutrq2xifYVd0ezuK4LWSQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYBX61vhMN81bk_A-_ahWB8kutrq2xifYVd0ezuK4LWSQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libxml2: fix LSB desktop-xml tests failure
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
X-List-Received-Date: Tue, 17 Sep 2013 11:18:20 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/17/2013 07:13 PM, Burton, Ross wrote:
> On 17 September 2013 12:10, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>>> So, NAK to this patch, and a revert incoming.
>> Great, the libxml2-CVE-2012-2871.patch is obsolete, abandon it could fix the
>> LSB desktop-xml tests failure. I wll resend the patch to do this.
> As I said above, a revert was incoming (and is now on the list).
>
> Ross

Sorry for the missing. Thank you for your attention.

//Hongxu

