Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QQ4H4-0007HG-1q
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 23:08:50 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 May 2011 14:05:43 -0700
X-ExtLoop1: 1
Received: from vorpal.jf.intel.com (HELO [10.7.199.68]) ([10.7.199.68])
	by orsmga002.jf.intel.com with ESMTP; 27 May 2011 14:05:43 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2011 14:09:13 -0700
In-Reply-To: <03D2A4C3-146E-4611-B730-8199ED9984DD@gmail.com>
References: <cover.1306477652.git.lianhao.lu@intel.com>
	<1306515635.27470.284.camel@rex>
	<7DC6724C-BF20-4EA1-A87D-32FBEEECDA3B@dominion.thruhere.net>
	<1306526949.1747.8.camel@vorpal> <1306530057.1747.11.camel@vorpal>
	<03D2A4C3-146E-4611-B730-8199ED9984DD@gmail.com>
X-Mailer: Evolution 3.0.1 (3.0.1-1.fc15) 
Message-ID: <1306530554.1747.17.camel@vorpal>
Mime-Version: 1.0
Subject: Re: [bitbake-devel] [PATCH 00/11] Add PR service and integrate PKGV/PKGR from OE
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
X-List-Received-Date: Fri, 27 May 2011 21:08:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-27 at 14:01 -0700, Khem Raj wrote:
> 
> On May 27, 2011, at 2:00 PM, Joshua Lock <josh@linux.intel.com> wrote:
> 
> > On Fri, 2011-05-27 at 13:09 -0700, Joshua Lock wrote:
> >> Upstream BitBake still has the xmlrpc server removed. The version in
> >> Poky's BitBake is functional (I use it daily).
> >> 
> >> Attached are two patches against BitBake master to add back the xmlrpc
> >> server (copied from Poky's tree) and fix the uievent.
> > 
> > Something in the pipeline is eating patches.
> > 
> > I'll send them as replies to this message.
> 
> I think it's the mailing list setup. When I attach a patch it never goes through
> Inlining the patch does go through
> > 

Yeah. It seems to be the oe-core list mangling patches. The attachments
made it to bitbake-devel fine.

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Project Build Monkey
        Intel Open Source Technology Centre



