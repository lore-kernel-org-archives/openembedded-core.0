Return-Path: <saul.wold@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC4C7666E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 16:44:58 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 01 Feb 2016 08:44:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,381,1449561600"; d="scan'208";a="645242389"
Received: from sghosh7-mobl1.amr.corp.intel.com ([10.254.78.200])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Feb 2016 08:44:59 -0800
Message-ID: <1454345098.22468.127.camel@intel.com>
From: Saul Wold <saul.wold@intel.com>
To: Jianxun Zhang <jianxun.zhang@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 01 Feb 2016 08:44:58 -0800
In-Reply-To: <56AA8748.40003@linux.intel.com>
References: <56AA8748.40003@linux.intel.com>
X-Mailer: Evolution 3.18.1 (3.18.1-1.fc23) 
Mime-Version: 1.0
Subject: Re: Backport Request: kernel-yocto: fix checkout bare-cloned kernel repositories
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
X-List-Received-Date: Mon, 01 Feb 2016 16:44:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-01-28 at 13:25 -0800, Jianxun Zhang wrote:
> Please help to bring this patch to Jethro branch:
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=4487e3a4205
> 188cf53930147c7e88d98f0d8a8e0
> 
As this is against OE-Core, this should really reference the
git.openembedded.org cgit, not Poky.

Please update the reference.

Sau!

> This fix was from updating kernel labs for Jethro and we think it
> should 
> be a good one on Jethro.
> 
> Thanks lot!

