Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 69CC277038
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 14:53:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 06 May 2016 07:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,587,1455004800"; d="scan'208";a="970185145"
Received: from jlock-mobl2.ger.corp.intel.com ([10.252.20.187])
	by orsmga002.jf.intel.com with ESMTP; 06 May 2016 07:53:53 -0700
Message-ID: <1462546432.3497.8.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 06 May 2016 15:53:52 +0100
In-Reply-To: <20160506144602.GG2544@jama>
References: <cover.1462544086.git.joshua.g.lock@intel.com>
	<20160506144602.GG2544@jama>
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Subject: Re: [Fido][PATCH 00/21] Consolidated pull request
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
X-List-Received-Date: Fri, 06 May 2016 14:53:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-05-06 at 16:46 +0200, Martin Jansa wrote:
> On Fri, May 06, 2016 at 03:34:11PM +0100, Joshua Lock wrote:
<snip>
> > Ross Burton (5):
> >   Revert "libsdl: depends on libglu when x11"
> Why do you want to backport the change and also its revert?

Good catch, removed in the repos on *-contrib.

Thanks,

Joshua

