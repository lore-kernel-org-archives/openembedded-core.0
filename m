Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C11AB771C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 15:16:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 29 Feb 2016 07:16:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,521,1449561600"; d="scan'208";a="923472426"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.11.10])
	by orsmga002.jf.intel.com with ESMTP; 29 Feb 2016 07:16:41 -0800
Message-ID: <1456758995.3164.17.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org, akuster@mvista.com
Date: Mon, 29 Feb 2016 15:16:35 +0000
In-Reply-To: <cover.1456242658.git.akuster@mvista.com>
References: <cover.1456242658.git.akuster@mvista.com>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Subject: Re: [fido][PATCH 0/7] fido Security fixes pull request
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
X-List-Received-Date: Mon, 29 Feb 2016 15:16:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-02-23 at 07:58 -0800, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
> 
> Please consider these for the next fido 
> 
> This is to meet our obligation for Yocto compatibility
> 
> The following changes since commit
> 06d9c894636352a6c93711c7284d02b0c794a527:
> 
>   libbsd: Security fix CVE-2016-2090 (2016-02-18 11:03:10 +0000)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib akuster/fido_cve_fixes
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/fi
> do_cve_fixes
> 
> Armin Kuster (7):
>   qemu: Security fix CVE-2016-2198
>   foomatic-filters: Security fix CVE-2015-8560
>   foomatic-filters: Security fixes CVE-2015-8327
>   tiff: Security fix CVE-2015-8781
>   tiff: Security fix CVE-2015-8784
>   librsvg: Security fix CVE-2015-7558
>   gdk-pixbuf: Security fix CVE-2015-7674

Queued in joshuagl/fido-next

Regards,

Joshua

