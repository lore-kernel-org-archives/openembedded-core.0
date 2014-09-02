Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D0176AC85
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 11:17:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s82BHJra007174
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Sep 2014 04:17:19 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 2 Sep 2014 04:17:18 -0700
Message-ID: <5405A73D.2060109@windriver.com>
Date: Tue, 2 Sep 2014 19:17:17 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1409650332.git.liezhi.yang@windriver.com>
	<5b78099a3fbf3740a08eba0bf9c88fceaa14f3b6.1409650332.git.liezhi.yang@windriver.com>
	<CAJTo0LZwP+mJQQNK5AvUub2OzF77_wSm1kDpVJniztigYurznQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZwP+mJQQNK5AvUub2OzF77_wSm1kDpVJniztigYurznQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] piglit: add bash to RDEPENDS_piglit
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
X-List-Received-Date: Tue, 02 Sep 2014 11:17:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/02/2014 06:19 PM, Burton, Ross wrote:
> On 2 September 2014 10:41, Robert Yang <liezhi.yang@windriver.com> wrote:
>> The bash scripts are in the tests directory, we had planned to move the
>> tests into the ptest pkg, but that would make piglit unusable without
>> installing piglit-ptest.
>
> Will there be a follow-up to add the ptest support?

Yes, I think so, Chong had done that, he will update the ptest patch.

// Robert

>
> Ross
>
>

