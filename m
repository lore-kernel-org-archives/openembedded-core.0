Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21DA96093E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 15:29:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA3FTRgP002698
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Nov 2016 08:29:27 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 3 Nov 2016 08:29:26 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>
References: <CAJ86T=Wp0B_kpgD20y2q89cL=C8hfy5AT0jF42-hiSDE-L+wKA@mail.gmail.com>
	<CAJTo0LZdGvZ2wvuwQR6v-daF8yHyq9+hTrNNAgxj2GHwMEZnBA@mail.gmail.com>
	<CAMKF1src9Pw2=6T7V3J7vmrccFkU5-POCukerpZYFQDxj8we+A@mail.gmail.com>
	<CAMKF1sp2Bft-bhJqT_C0siXFiHJyT8ouqoNQ2vmt-XGnJqw9Wg@mail.gmail.com>
	<13e6f9fa-fc42-68cf-3961-33c43d26e13f@linux.intel.com>
	<CAJTo0LayXt5s0d+Sho6HtWiU53vnoJ5=JaZPLz5hKDXsCB_jtw@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <d65d071b-28bc-5513-75f1-a609472e6a95@windriver.com>
Date: Thu, 3 Nov 2016 10:29:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LayXt5s0d+Sho6HtWiU53vnoJ5=JaZPLz5hKDXsCB_jtw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: version of gdb in morty
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
X-List-Received-Date: Thu, 03 Nov 2016 15:29:28 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 11/3/16 9:06 AM, Burton, Ross wrote:
> 
> On 3 November 2016 at 13:32, Alexander Kanavin
> <alexander.kanavin@linux.intel.com <mailto:alexander.kanavin@linux.intel.com>>
> wrote:
> 
>     Update to 7.12 for master branch please.
> 
> 
> To ease backporting to morty, taking 7.11.1 and then 7.12 makes sense to me.

I'm fine with this as well..  The third digit release is small enough of a
change, I don't think it will impact stability on such a new release.

--Mark

> Ross
> 
> 


