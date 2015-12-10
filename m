Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 22D44608B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 10:52:45 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 10 Dec 2015 02:52:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,407,1444719600"; d="scan'208";a="10854125"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 10 Dec 2015 02:52:45 -0800
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
	<80f3d12d7eb901a0deb50508d54bd89192b88a8a.1449671297.git.alexander.kanavin@linux.intel.com>
	<5668866A.7030900@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <566958EC.9030103@linux.intel.com>
Date: Thu, 10 Dec 2015 12:50:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.3.0
MIME-Version: 1.0
In-Reply-To: <5668866A.7030900@gmail.com>
Subject: Re: [PATCH 01/10] openssl: update to 1.0.2e
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
X-List-Received-Date: Thu, 10 Dec 2015 10:52:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/09/2015 09:52 PM, akuster808 wrote:
> Can we get the CVE's fix by this update included in the commit?

It's a version update to oe-core's development branch (e.g. 
non-production, frequently updated), why have the CVEs in the commit 
message? I understand why this is needed for already-released branches, 
but can't see why do it for something that hasn't been released yet.

Alex


