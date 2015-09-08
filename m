Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 59C0B65C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 16:58:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 08 Sep 2015 09:58:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,491,1437462000"; d="scan'208";a="785165431"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.5.41])
	([10.219.5.41])
	by fmsmga001.fm.intel.com with ESMTP; 08 Sep 2015 09:58:19 -0700
Message-ID: <55EF13FA.5060002@linux.intel.com>
Date: Tue, 08 Sep 2015 11:59:38 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>, 
	openembedded-core@lists.openembedded.org
References: <1441730435-26769-1-git-send-email-alejandro.delcastillo@ni.com>
In-Reply-To: <1441730435-26769-1-git-send-email-alejandro.delcastillo@ni.com>
Subject: Re: [PATCHv2] adt-installer: upgrade to opkg 0.3.0
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
X-List-Received-Date: Tue, 08 Sep 2015 16:58:44 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


On 09/08/2015 11:40 AM, Alejandro del Castillo wrote:
> - Remove deprecated --disable-shave & --withopkglibdir options.
> - Add -i option to autoreconf since opkg tarball is missing conf.compile
> - Recreate wget_cache.patch
> - Bump PR version.

there is no need to bump the PR version, PR values are managed now by 
the PR server.


