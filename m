Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CE32D7C37F;
	Thu,  5 Dec 2019 10:19:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2019 02:19:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,281,1571727600"; d="scan'208";a="386122512"
Received: from lokx-mobl1.gar.corp.intel.com (HELO shodan.localnet)
	([10.249.69.245])
	by orsmga005.jf.intel.com with ESMTP; 05 Dec 2019 02:19:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 05 Dec 2019 21:09:30 +1300
Message-ID: <2454376.zbUpM14kzO@shodan>
Organization: Intel Corporation
In-Reply-To: <CAP71WjybqtUNXJWnOv52QQYevR99_tVyEPpHjx_rwVZfjU02nA@mail.gmail.com>
References: <216e9c7062d44b98a54b6fd572128266383e83ad.camel@linuxfoundation.org>
	<9058755.I6fkynWszP@shodan>
	<CAP71WjybqtUNXJWnOv52QQYevR99_tVyEPpHjx_rwVZfjU02nA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] OE-Core python minimum version requirement
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
X-List-Received-Date: Thu, 05 Dec 2019 10:19:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 5 December 2019 7:48:11 PM NZDT Nicolas Dechesne wrote:
> On Thu, Dec 5, 2019 at 3:08 AM Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > FYI I came across repology.org which tells you the version of various
> > packages in each distro, though it's not ideal:
> >
> >   https://repology.org/project/python/versions
> 
> Nice! How do we get OE plugged into that? Have you looked at that?

No, I haven't - only discovered it today. I agree we should look into it 
though.

Cheers
Paul

-- 

Paul Eggleton
Intel System Software Products



