Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7820F784B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 16:03:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 18 Aug 2017 09:03:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,393,1498546800"; d="scan'208";a="891439185"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Aug 2017 09:03:09 -0700
Message-ID: <1503072722.28682.36.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Andrej Valek <andrej.valek@siemens.com>
Date: Fri, 18 Aug 2017 11:12:02 -0500
In-Reply-To: <78647462-c423-bdc3-8adb-544fe8eee978@siemens.com>
References: <78647462-c423-bdc3-8adb-544fe8eee978@siemens.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: bussybox: updating to new version
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
X-List-Received-Date: Fri, 18 Aug 2017 16:03:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-08-18 at 12:16 +0200, Andrej Valek wrote:
> Hello everyone,
> 
> I would like to ask you a question about busybox upgrading.
> 
> Is there any reason, why we are still using the version 1.24.1?
> I think that, the latest version 1.27.2 has a lot of fixes and it less
> vulnerable then the current.
> 

feel free to send a patch with the upgrade. BTW, this is the upgrade
history of the recipe

http://recipes.yoctoproject.org/rrs/recipedetail/12601/

> I have checked a license and it has not been changed.
> 
> Thank you for the explanation.
> 
> Andrej



