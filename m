Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R3d4p-00026D-3y
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 02:11:43 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Sep 2011 17:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,375,1312182000"; d="scan'208";a="16821726"
Received: from unknown (HELO [10.255.14.59]) ([10.255.14.59])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Sep 2011 17:06:32 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2011 17:06:26 -0700
In-Reply-To: <1315958498.25993.7.camel@ted>
References: <cover.1315956050.git.sgw@linux.intel.com>
	<3be290aac4da885fe5bc31797c4a689196c63b7a.1315956050.git.sgw@linux.intel.com>
	<1315958207.2252.22.camel@scimitar> <1315958498.25993.7.camel@ted>
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1315958792.2252.24.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] libzypp: move package-manger to it own package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2011 00:11:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-14 at 01:01 +0100, Richard Purdie wrote:
> On Tue, 2011-09-13 at 16:56 -0700, Joshua Lock wrote:
> > On Tue, 2011-09-13 at 16:41 -0700, Saul Wold wrote:
> > > [YOCTO #1234]
> > 
> > Aside/nitpick: I really hate this being the first line.
> 
> I have to admit I don't like it either but it is what the commit
> guidelines suggest. I have wondered about proposing to change them but
> haven't had time...

Oh! I seem to have read/remembered that it should be at the bottom - as
I always do. Particularly as for the wider oe-core userbase the
information is not especially relevant.

I will write a formal proposal for the change.

Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



