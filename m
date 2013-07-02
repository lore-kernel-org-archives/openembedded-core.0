Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id AC8D361AD1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 18:54:36 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Uu5im-0001N9-VA; Tue, 02 Jul 2013 20:54:37 +0200
Message-ID: <1372791267.2074.25.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
Date: Tue, 02 Jul 2013 19:54:27 +0100
In-Reply-To: <1372787148-9023-1-git-send-email-elizabeth.flanagan@intel.com>
References: <1372787148-9023-1-git-send-email-elizabeth.flanagan@intel.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] layer.conf: Bumping LAYERVERSION_core
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
X-List-Received-Date: Tue, 02 Jul 2013 18:54:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-07-02 at 10:45 -0700, Elizabeth Flanagan wrote:
> Bumping LAYERVERSION_core to denote where meta-toolchain* is being
> depreciated.

This commit message doesn't provide much explanation of what exactly is
going on and why this constitutes "significant changes that will
cause compatibility issues with other layers".  Can you clarify?

thanks

p.



