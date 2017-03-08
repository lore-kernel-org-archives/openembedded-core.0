Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id ADA8572FFD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 11:23:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2017 03:23:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,262,1486454400"; d="scan'208";a="941962220"
Received: from janmalax-mobl1.ger.corp.intel.com (HELO
	jlock-mobl1.ger.corp.intel.com) ([10.252.1.102])
	by orsmga003.jf.intel.com with ESMTP; 08 Mar 2017 03:23:16 -0800
Message-ID: <1488972195.2982.5.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Peter Kjellerstedt
	<peter.kjellerstedt@axis.com>
Date: Wed, 08 Mar 2017 11:23:15 +0000
In-Reply-To: <1488971483.22968.64.camel@linuxfoundation.org>
References: <1488910966-30028-1-git-send-email-richard.purdie@linuxfoundation.org>
	<08203c70694442b388883c73d7f160b0@XBOX02.axis.com>
	<1488971483.22968.64.camel@linuxfoundation.org>
X-Mailer: Evolution 3.22.5 (3.22.5-1.fc25) 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes: Move out stale GPLv2 versions to a seperate layer
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
X-List-Received-Date: Wed, 08 Mar 2017 11:23:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-08 at 11:11 +0000, Richard Purdie wrote:
> On Wed, 2017-03-08 at 09:34 +0000, Peter Kjellerstedt wrote:
> > 
> > And the layer should be added to the layer index...
> 
> Yes, it should.

I've submitted meta-gplv2 to the layer index.

Joshua

