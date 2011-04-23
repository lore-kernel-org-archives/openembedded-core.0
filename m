Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QDjRs-0003Hx-GG
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 22:29:01 +0200
Received: by ewy5 with SMTP id 5so398292ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Apr 2011 13:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:from:date:message-id:subject:to
	:content-type; bh=XzD/tznBDAPmYzkEyc4TW8wQsICkFl0VFdFRmOkfn4M=;
	b=FVRnq6mmETB+j3Ei8/4kI7q65opPG9Gi8wyMkCyG3lAKHF8dwepU5nelY/Y0HHtnW4
	AHQj+ARPyULGO3q9XdVUYyPcLs0npqOlos2LMhN+HPpeuu5gj4MV8mfSx+bVqWGY3vrw
	TJ+jAoghH5BtkKGWSO4R2Z9RLmdNXdndUZBdw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=JJMqoCRkrCweISBOpoQme2NxWCxtczHBZc5QgZO8mD7YrlMfofUTeVvTZmswqP0HL/
	62psix0yd0WbBrDh9zpTFXbpL9iYANgcnhs9yzWSuo8ASmbs3TRT4hAZB2j4izqa1Yqa
	jR7yyxrTs9lmrryDoXU8DW3zQace2nlBWd4P8=
Received: by 10.14.125.146 with SMTP id z18mr792332eeh.28.1303590393164; Sat,
	23 Apr 2011 13:26:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.119.196 with HTTP; Sat, 23 Apr 2011 13:26:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Apr 2011 13:26:03 -0700
Message-ID: <BANLkTimoLw8aG6xm8zUgJXUfHRvJuqOdyA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Perl 5.12.2 no more fetchable
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
X-List-Received-Date: Sat, 23 Apr 2011 20:29:01 -0000
Content-Type: text/plain; charset=UTF-8

Since the latest stable is 5.12.3 this mirror we use in SRC_URI has
decided to dump 5.12.2 tarball. Either we upgrade to 5.12.3 or find  a
mirror which still have 5.12.2 e.g.
http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/perl-5.12.2.tar.gz

Thanks
-Khem


