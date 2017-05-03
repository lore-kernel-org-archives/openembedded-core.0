Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8D8DE60603
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 07:01:03 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 May 2017 00:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,283,1491289200"; d="scan'208";a="96603471"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 03 May 2017 00:01:03 -0700
To: Tomas Novotny <tomas@novotny.cz>
References: <20170502125151.5095-1-alexander.kanavin@linux.intel.com>
	<20170502125151.5095-6-alexander.kanavin@linux.intel.com>
	<20170502185052.0e094df2@tomas.local.tbs-biometrics.cz>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <7fc9874e-0a6e-6054-74dd-e2bbdd515966@linux.intel.com>
Date: Wed, 3 May 2017 10:01:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170502185052.0e094df2@tomas.local.tbs-biometrics.cz>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] mobile-broadband-provider-info: upgrade to 20170310
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
X-List-Received-Date: Wed, 03 May 2017 07:01:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2017 07:50 PM, Tomas Novotny wrote:
> this package contains platform independent xml and dtd only. So I guess that
> allarch class can be inherited. Does it makes sense to create a separate patch or
> is it better to squash it here?

A separate patch is better - feel free to send one and take the credit :)

Alex


