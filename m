Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 66C856FF97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 12:29:58 +0000 (UTC)
Received: from [212.183.132.60] (helo=e130) by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>) id 1agAaL-0005gO-OQ
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Mar 2016 13:29:58 +0100
Message-ID: <1458131361.2038.28.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Mar 2016 12:29:21 +0000
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: X.org licenses
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
X-List-Received-Date: Wed, 16 Mar 2016 12:29:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This morning it came to my notice that libxdmcp, and a bunch of other
files (mostly, though not exclusively, in xorg-libs) contain things
like:

LICENSE = "MIT-style"

It's not very clear to me whether "MIT-style" is meant to mean "an
unspecified license in the same general style as the MIT one" or whether
it refers to a single concrete license.  (There is no MIT-style in
meta/files/common-licenses.)

Does anybody happen to know what the intended meaning of this license
is?

thanks

p.



