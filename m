Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B3F8777045;
	Fri,  5 Aug 2016 08:42:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 05 Aug 2016 01:42:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,473,1464678000"; d="scan'208";a="1030216593"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 05 Aug 2016 01:42:35 -0700
Date: Fri, 5 Aug 2016 11:43:34 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20160805084333.GB1920@mbabyjoh-desk.ger.corp.intel.com>
References: <20160804195645.1254.80390@opal.openembedded.org>
	<20160804195647.4E7D15017B@opal.openembedded.org>
	<CA+chaQc0hKwRL1rJohYRxTG3GBre8xAqBpqrKzBwd6mnE9_sxQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQc0hKwRL1rJohYRxTG3GBre8xAqBpqrKzBwd6mnE9_sxQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 06/10: tslib: replace pointercal with pointercal-xinput
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
X-List-Received-Date: Fri, 05 Aug 2016 08:42:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Aug 04, 2016 at 10:08:29PM +0200, Martin Jansa wrote:
>Since when tslib reads pointercal-xinput file?

This change wasn't tested due to non availability of required hardware. Will revert this
change.

>On Thu, Aug 4, 2016 at 9:56 PM, <git@git.openembedded.org> wrote:
>
>    rpurdie pushed a commit to branch master-next       in repository openembedded-core.

Thanks,
Maxin

