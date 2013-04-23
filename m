Received: from mail-vc0-f174.google.com ([209.85.220.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1UUYrT-0001qq-Du
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 10:46:10 +0200
Received: by mail-vc0-f174.google.com with SMTP id kw10so333300vcb.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 01:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:content-type;
	bh=Jd9beFEFbDrPBJIJiWUSoCcjrg0JhqQtiofPehBL7XQ=;
	b=Z3c2V5qFeehq+RV55eQmk0Ye9H4lguBtx4ieQP/liaqrROJXT6oApcjI3BurwM5iTa
	3+7Ir7XVsiygOl0R1X0RF4BvMFkPU8ag+aH3vl/y+jzVBGrkx1BdkrbV0jIbuNprHyy1
	30i99ZS90nhRt6LhdZy62+zc9qiYoMIEx6kBR/L4F2NwAQMaAXs6+Ai4Q9/UwACxQmRw
	s1/oEydr1YBgvhHC6YHhUK30/GHTXyLushHc9JumwvAEOhUhv5SYIsx/2eM9+RjwqJZz
	Ptmn3GTJgmhn2Raqim2pNxW19LIo3mq89h8cQYel2IyrqWy+b/YIKUjxGX3cVEVcobuO
	tAuw==
MIME-Version: 1.0
X-Received: by 10.58.56.161 with SMTP id b1mr21811878veq.42.1366705701791;
	Tue, 23 Apr 2013 01:28:21 -0700 (PDT)
Sender: paul.betafive@gmail.com
Received: by 10.220.224.135 with HTTP; Tue, 23 Apr 2013 01:28:21 -0700 (PDT)
Date: Tue, 23 Apr 2013 09:28:21 +0100
X-Google-Sender-Auth: je0n5d8E08c8d7GhSEAA_OVrRS4
Message-ID: <CANyK_8daiW+Mn9LQLh72hgqPjW-HOYMMKR68fB=A2k-gT42gUw@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: AGPL-3.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Apr 2013 08:46:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

I noticed that the copy of AGPL-3.0 in common-licenses
(http://git.openembedded.org/openembedded-core/tree/meta/files/common-licenses/AGPL-3.0)
just contains the string "license exceeds allowable cell character
limit". Is this intentional or should it be replaced with the full
license text? If so I can send in a patch to fix this.

Thanks,

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk


