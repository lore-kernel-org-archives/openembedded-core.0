Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C1C0C73BB4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 13:23:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Jul 2015 06:23:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,423,1432623600"; d="scan'208";a="759845360"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by orsmga002.jf.intel.com with ESMTP; 07 Jul 2015 06:23:08 -0700
Message-ID: <559BD2DE.8080801@linux.intel.com>
Date: Tue, 07 Jul 2015 16:23:42 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1436195315.git.tanu.kaskinen@linux.intel.com>
In-Reply-To: <cover.1436195315.git.tanu.kaskinen@linux.intel.com>
Subject: Re: [PATCH 0/3] speex, speexdsp: 1.2rc1 -> 1.2rc2/1.2rc3
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
X-List-Received-Date: Tue, 07 Jul 2015 13:23:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 07/06/2015 06:14 PM, Tanu Kaskinen wrote:
> These patches update speex to 1.2rc2 and speexdsp to 1.2rc3. speexdsp
> was previously included in speex, but now it's in a separate source
> tree, so a new recipe is needed.

The gap between rc1 and rc2 has been six *years*, and rc2 has been 
released 7 *months* ago. The upstream clearly doesn't know the 
definition of 'release candidate' :)

I'm totally fine with your patches, just in case.


Alex

