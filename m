Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PsKiW-0001Fn-8A
	for openembedded-core@lists.linuxtogo.org;
	Wed, 23 Feb 2011 20:49:44 +0100
Received: by fxm8 with SMTP id 8so3949256fxm.6
	for <openembedded-core@lists.linuxtogo.org>;
	Wed, 23 Feb 2011 11:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type; bh=wrWCaVGtJQLLw7Jb/nvAXu+b5cH9mChmdFyhSHUtDYE=;
	b=MWEiPfAtw2fZFxbADq5MOGWCZU7jWOIYvgypdUnAOZFGrcTLKZ41fGxFzUjNOBVHPr
	Qbvr6LP0RzTr/+/XiHm+WibQkdU6mJcgvLqGzbey21apu5S7eetg+ttINmCGWprgt80T
	5YeGUcGZ2PtLSuZu7zhNFzymx0E9JgkzeS9j0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=GM07znq664vd/cR+kcOnuSaxtFkmJ7/42pYGyNew6xdgRPuMiupHpJfsH1HVPvXrgh
	Iw/we/rTR83cwFpdBCz3Vzw3POm27F+EHKE1cIbx0DXhKZJGVlyNSh470pz12jb1WjOT
	YmeZnFaAt/jq4DiEbqjg4huufrT5itykIPDi4=
Received: by 10.223.79.14 with SMTP id n14mr5801398fak.19.1298490345754; Wed,
	23 Feb 2011 11:45:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Wed, 23 Feb 2011 11:42:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Feb 2011 11:42:38 -0800
Message-ID: <AANLkTimVvB5r=SDrXMaGu=6sNHWX5PPj1cn+Suqpmv-q@mail.gmail.com>
To: openembedded-core@lists.linuxtogo.org
Subject: openembedded-core repo goes live
X-BeenThere: openembedded-core@lists.linuxtogo.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.linuxtogo.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.linuxtogo.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.linuxtogo.org>
List-Help: <mailto:openembedded-core-request@lists.linuxtogo.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.linuxtogo.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Feb 2011 19:49:44 -0000
Content-Type: text/plain; charset=UTF-8

Hello all

openembedded-core is live now. You can clone it by

git clone git://git.openembedded.org/openembedded-core

any patches that are sent to openembedded-core mailing list
are captured by patchwork too at

http://patches.openembedded.org/project/oe-core/list/

Thanks

-Khem


