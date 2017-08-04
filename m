Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AC62371BA0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 12:42:18 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Aug 2017 05:42:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,321,1498546800"; d="scan'208";a="295800118"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga004.fm.intel.com with ESMTP; 04 Aug 2017 05:42:17 -0700
Date: Fri, 4 Aug 2017 15:43:42 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170804124341.GA29531@mbabyjoh-desk.ger.corp.intel.com>
References: <1500022363-22674-1-git-send-email-maxin.john@intel.com>
	<CAJTo0LYuW6f62E5G+sNh6WFFcc6u3z3GXcxmkGNz0vVZTz8pMw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYuW6f62E5G+sNh6WFFcc6u3z3GXcxmkGNz0vVZTz8pMw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] pkgconf: add recipe
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
X-List-Received-Date: Fri, 04 Aug 2017 12:42:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

On Fri, Aug 04, 2017 at 01:26:25PM +0100, Burton, Ross wrote:
>
>A recent patch to pkgconfig to make menuconfig work in the SDK has since landed in master.  Can you adapt the patch so that it also applies for pkgconf?

Will do that, Thanks.

>Cheers,
>Ross
>>
>>On 14 July 2017 at 09:52, Maxin B. John <maxin.john@intel.com> wrote:
>> Move pkgconf recipe to oe-core from meta-pkgconf:
>>https://github.com/kergoth/meta-kergoth-wip/tree/master/meta-pkgconf

Cheers,
Maxin

