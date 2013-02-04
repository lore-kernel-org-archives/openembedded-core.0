Received: from mail-vc0-f174.google.com ([209.85.220.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1U2PgY-0001pb-Ty
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 18:18:27 +0100
Received: by mail-vc0-f174.google.com with SMTP id n11so3977830vch.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 09:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=XqowYfIzBJwqGQ36+xU5QdkSd2rrmi2IPiVZyotuJds=;
	b=LOJZLrHPs9nEW3gC9hGRzVucYXV64Oq1sqvduZX2zFclou0HULK3IE+Z/8JvUMovl9
	cz4B7/AzPICYbC1rmV56ZRGUJnKP32C0UIoaYQOldNihVB0Nvmv0TDZ3ANtRhlInOQX5
	3aC4Dlolc9IZ2A1bg1S5vQvHTxPUeIBnwnmAuRsUx7wd3bOexIDFAkITjf2w+IsT9Tx3
	3NLr+ZI6/4c9UQbew8rf9yAOWWCis4HIiRY7YKfhxdme/WFubhGMozT2U68AkhTqD/zu
	F5cNtT52OU/sApvx2Uy7HCXwI25BL0fhX7jGKifSJq/rb3w8CQP43wD8sOQWF030qWwl
	YzWQ==
MIME-Version: 1.0
X-Received: by 10.52.32.230 with SMTP id m6mr5983471vdi.83.1359997358234; Mon,
	04 Feb 2013 09:02:38 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Mon, 4 Feb 2013 09:02:38 -0800 (PST)
Date: Mon, 4 Feb 2013 18:02:38 +0100
Message-ID: <CALbNGRTJ=ZsxFYkum748dFNh853fv4vH-AW9WvLo1P66TovQ2Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: master-next commit notifications
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
X-List-Received-Date: Mon, 04 Feb 2013 17:18:28 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

is it a problem to stop the commit notification on master-next? It
seems that master-next is subject to frequent rebasing and causing a
flood of commit notification mails. My problem is that it makes it
difficult to find the notifications for those commits applied to
master.

Andreas


