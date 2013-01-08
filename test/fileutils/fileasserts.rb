# $Id: fileasserts.rb 35553 2012-05-07 01:23:07Z nobu $

module Test
  module Unit
    module FileAssertions
      def assert_same_file(from, to, message=nil)
        assert_equal(File.read(from), File.read(to), "file #{from} != #{to}#{message&&': '}#{message||''}")
      end

      def assert_same_entry(from, to, message=nil)
        a = File.stat(from)
        b = File.stat(to)
        msg = "#{message&&': '}#{message||''}"
        assert_equal a.mode, b.mode, "mode #{a.mode} != #{b.mode}#{msg}"
        #assert_equal a.atime, b.atime
        assert_equal_timestamp a.mtime, b.mtime, "mtime #{a.mtime} != #{b.mtime}#{msg}"
        assert_equal a.uid, b.uid, "uid #{a.uid} != #{b.uid}#{msg}"
        assert_equal a.gid, b.gid, "gid #{a.gid} != #{b.gid}#{msg}"
      end

      def assert_file_exist(path, message=nil)
        assert(File.exist?(path), "file not exist: #{path}#{message&&': '}#{message||''}")
      end

      def assert_file_not_exist(path, message=nil)
        assert(!File.exist?(path), "file exist: #{path}#{message&&': '}#{message||''}")
      end

      def assert_directory(path, message=nil)
        assert(File.directory?(path), "is not directory: #{path}#{message&&': '}#{message||''}")
      end

      def assert_symlink(path, message=nil)
        assert(File.symlink?(path), "is not a symlink: #{path}#{message&&': '}#{message||''}")
      end

      def assert_not_symlink(path)
        assert(!File.symlink?(path), "is a symlink: #{path}#{message&&': '}#{message||''}")
      end

      def assert_equal_time(expected, actual, message=nil)
        expected_str = expected.to_s
        actual_str = actual.to_s
        if expected_str == actual_str
          expected_str << " (nsec=#{expected.nsec})"
          actual_str << " (nsec=#{actual.nsec})"
        end
        full_message = build_message(message, <<EOT)
<#{expected_str}> expected but was
<#{actual_str}>.
EOT
        assert_equal(expected, actual, full_message)
      end

      def assert_equal_timestamp(expected, actual, message=nil)
        expected_str = expected.to_s
        actual_str = actual.to_s
        if expected_str == actual_str
          expected_str << " (nsec=#{expected.nsec})"
          actual_str << " (nsec=#{actual.nsec})"
        end
        full_message = build_message(message, <<EOT)
<#{expected_str}> expected but was
<#{actual_str}>.
EOT
        # subsecond timestamp is not portable.
        assert_equal(expected.tv_sec, actual.tv_sec, full_message)
      end

    end
  end
end